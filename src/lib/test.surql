-- Test data, for fake users, organizations, classes, etc.
-- To import:
-- surreal import --conn http://localhost:8000 --user root --pass root --ns schedule --db schedule src/lib/test.surql

-- Register API
fn::registerAPI("webpage", "password");

-- Our test organizations - we only need one, but we create a few for the login viewpage
CREATE organization SET name = "School Alpha", signupType = "password", slug = "alpha";
CREATE organization SET name = "School Beta", signupType = "password", slug = "beta";
CREATE organization SET name = "School Theta", signupType = "classlink", slug = "theta";

-- Set up accounts
CREATE user CONTENT {
    firstName: "Normalized",
    lastName: "Vector",
    email: "normal.vector@school.com",
    role: "student",
    organization: array::first((SELECT id FROM organization WHERE slug == "theta").id),

    password: crypto::argon2::generate("student"),
};
