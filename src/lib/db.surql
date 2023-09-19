-- Define NS and DB
USE NS schedule;
DEFINE DATABASE schedule;

-- Define our tables
DEFINE TABLE user SCHEMAFULL;
    DEFINE FIELD firstName ON TABLE user TYPE string;
    DEFINE FIELD lastName ON TABLE user TYPE string;
    DEFINE FIELD email ON TABLE user TYPE string ASSERT string::is::email($value);
    DEFINE FIELD role ON TABLE user TYPE string ASSERT $value = /admin|teacher|student/;
    DEFINE FIELD organization ON TABLE user TYPE record<organization>;
    DEFINE INDEX userEmailIndex ON TABLE user COLUMNS email UNIQUE;

    DEFINE SCOPE user SESSION 1d;

DEFINE TABLE organization SCHEMAFULL;
    DEFINE FIELD name ON TABLE organization TYPE string;

-- Blocks are scheduled time slots
DEFINE TABLE block SCHEMAFULL;
    DEFINE FIELD from ON TABLE block TYPE datetime;
    DEFINE FIELD to ON TABLE block TYPE datetime;
    DEFINE FIELD organization ON TABLE block TYPE record<organization>;

-- Activites are things to be scheduled
DEFINE TABLE activity SCHEMAFULL;
    DEFINE FIELD name ON TABLE class TYPE string;
    DEFINE FIELD description ON TABLE class TYPE string;
    DEFINE FIELD organization ON TABLE class TYPE record<organization>;
    DEFINE FIELD owner ON TABLE class TYPE record<user> ASSERT $value->role = /teacher|admin/;

-- Classes are scheduled activities at a block
DEFINE TABLE session SCHEMAFULL;
    DEFINE FIELD activity ON TABLE session TYPE record<activity>;
    DEFINE FIELD maxStudents ON TABLE session TYPE int;
    DEFINE FIELD students ON TABLE class TYPE array<record<user>> ASSERT $value->role = /student/;
    DEFINE FIELD attendees ON TABLE class TYPE array<record<user>> ASSERT $value->role = /student/;
    DEFINE FIELD block ON TABLE session TYPE record<block>;
    -- We generate a random token that is used for students to mark attendance
    DEFINE FIELD token ON TABLE session TYPE string VALUE rand::int(111111, 999999);
