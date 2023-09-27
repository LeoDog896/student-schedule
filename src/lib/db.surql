-- Define NS and DB
USE NS schedule;
DEFINE DATABASE schedule;

-- We use this as a granual control "user" that we pass over to the backend.
-- That way, the backend doesn't have much control over the database.
DEFINE TABLE api SCHEMAFULL;
    DEFINE FIELD description ON TABLE api TYPE string;
    DEFINE FIELD password ON TABLE api TYPE string;
    DEFINE SCOPE api SESSION 1d
        SIGNIN (SELECT * FROM api WHERE description = $description AND crypto::argon2::compare($password, password));

DEFINE FUNCTION fn::registerAPI($description: string, $password: string) {
    CREATE api SET description = $description, password = crypto::argon2::generate($password);
};

-- Define our tables
DEFINE TABLE user SCHEMAFULL
    PERMISSIONS
        FOR create
            WHERE $scope = api;
    DEFINE FIELD firstName ON TABLE user TYPE string;
    DEFINE FIELD lastName ON TABLE user TYPE string;
    DEFINE FIELD email ON TABLE user TYPE string ASSERT string::is::email($value);
    DEFINE FIELD role ON TABLE user TYPE string ASSERT $value INSIDE ["student", "teacher", "admin"];
    DEFINE FIELD organization ON TABLE user TYPE record;
    DEFINE INDEX userEmailIndex ON TABLE user COLUMNS email UNIQUE;

    -- Authentication - either password or token
    DEFINE FIELD password ON TABLE user TYPE option<string>;
    DEFINE FIELD tokenExpires on TABLE user TYPE option<datetime>;
    DEFINE FIELD token ON TABLE user TYPE option<string>;

    DEFINE SCOPE user SESSION 1d
        -- For signin, you either need a Password or a Token, either for OAuth or signing in with our own platform.
        SIGNIN (SELECT * FROM user WHERE email = $email AND (token = $token OR crypto::argon2::compare($password, password)))
        -- Also, signup must happen with the `api` scope.
    ;

DEFINE TABLE organization SCHEMAFULL PERMISSIONS FOR select FULL, for create, delete, update NONE;
    DEFINE FIELD slug ON TABLE organization TYPE string;
    DEFINE FIELD name ON TABLE organization TYPE string;
    DEFINE FIELD signupType ON TABLE organization TYPE string ASSERT $value INSIDE ["password", "classlink"];

-- Blocks are scheduled time slots
DEFINE TABLE block SCHEMAFULL;
    DEFINE FIELD from ON TABLE block TYPE datetime;
    DEFINE FIELD to ON TABLE block TYPE datetime;
    DEFINE FIELD organization ON TABLE block TYPE record;

-- Activites are things to be scheduled
DEFINE TABLE activity SCHEMAFULL;
    DEFINE FIELD name ON TABLE activity TYPE string;
    DEFINE FIELD description ON TABLE activity TYPE string;
    DEFINE FIELD organization ON TABLE activity TYPE record;
    DEFINE FIELD owner ON TABLE activity TYPE record ASSERT $value->role INSIDE ["teacher", "admin"];

-- Classes are scheduled activities at a block
DEFINE TABLE session SCHEMAFULL;
    DEFINE FIELD activity ON TABLE session TYPE record;
    DEFINE FIELD maxStudents ON TABLE session TYPE int;
    DEFINE FIELD students ON TABLE session TYPE array<record>;
    DEFINE FIELD attendees ON TABLE session TYPE array<record>;
    DEFINE FIELD block ON TABLE session TYPE record;
    -- We generate a random token that is used for students to mark attendance
    DEFINE FIELD token ON TABLE session TYPE string VALUE rand::int(111111, 999999);
