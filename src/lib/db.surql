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

DEFINE TABLE block SCHEMAFULL;
    DEFINE FIELD from ON TABLE block TYPE datetime;
    DEFINE FIELD to ON TABLE block TYPE datetime;

DEFINE TABLE class SCHEMAFULL;
    DEFINE FIELD name ON TABLE class TYPE string;
    DEFINE FIELD organization ON TABLE class TYPE record<organization>;
    DEFINE FIELD owner ON TABLE class TYPE record<user> ASSERT $value->role = /teacher|admin/;
    DEFINE FIELD block ON TABLE class TYPE record<block>;
    DEFINE FIELD students ON TABLE class TYPE array<record<user>> ASSERT $value->role = /student/;
