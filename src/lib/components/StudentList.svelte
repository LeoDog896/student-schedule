<script>
    let students = [{
        id: 1,
        firstName: "John",
        lastName: "Doe",
        grade: 12
    }]

    function toggleAttendance() {

    }

</script>
<table>
    <thead>
        <tr>
            <th>Student ID</th>
            <th>First Name</th>
            <th>Last Name</th>
            <th>Grade</th>
            <th>Actions</th>
        </tr>
    </thead>
    <tbody>
        {#each students as student}
            <tr>
                <td>{student.id}</td>
                <td>{student.firstName}</td>
                <td>{student.lastName}</td>
                <td>{student.grade}</td>
                <td>
                    <button on:click={() => toggleAttendance(student)}>Not Here</button>
                </td>
            </tr>
        {/each}
    </tbody>
</table>