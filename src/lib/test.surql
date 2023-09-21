-- Test data, for fake users, organizations, classes, etc.
-- To import:
-- surreal import --conn http://localhost:8000 --user root --pass root --ns schedule --db schedule src/lib/test.surql

-- Register API
fn::registerAPI("Base API", "password")

-- Our test organizations
CREATE organization SET name = "School Alpha", signupType = "password";
CREATE organization SET name = "School Beta", signupType = "password";
CREATE organization SET name = "School Theta", signupType = "oauth";
