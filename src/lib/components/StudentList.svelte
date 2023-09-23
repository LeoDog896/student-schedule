<script lang="ts">
	interface Student {
		id: string;
		firstName: string;
		lastName: string;
	}

	let students: Student[] = [
		{
			id: 'id',
			firstName: 'John',
			lastName: 'Doe'
		}
	];

	function toggleAttendance(student: Student) {}
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
				<td>
					<button on:click={() => toggleAttendance(student)}>Not Here</button>
				</td>
			</tr>
		{/each}
	</tbody>
</table>
