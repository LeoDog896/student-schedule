-- Test data, for fake users, organizations, classes, etc.
-- To import:
-- surreal import --conn http://localhost:8000 --user root --pass root --ns schedule --db schedule src/lib/test.surql

-- Register API
fn::registerAPI("Base API", "password");

-- Our test organizations - we only need one, but we create a few for the login viewpage
CREATE organization SET name = "School Alpha", signupType = "password", slug = "alpha";
CREATE organization SET name = "School Beta", signupType = "password", slug = "beta";
CREATE organization SET name = "School Theta", signupType = "classlink", slug = "theta";

-- 
