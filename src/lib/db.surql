-- Define NS and DB
USE NS schedule;
DEFINE DATABASE schedule;

-- Define our tables
DEFINE TABLE user SCHEMAFULL;
    DEFINE FIELD firstName ON TABLE user TYPE string;
    DEFINE FIELD lastName ON TABLE user TYPE string;
    DEFINE FIELD email ON TABLE user TYPE string
    ASSERT string::is::email($value);
    DEFINE INDEX userEmailIndex ON TABLE user COLUMNS email UNIQUE;

    DEFINE SCOPE user SESSION 1d;

DEFINE TABLE block;
