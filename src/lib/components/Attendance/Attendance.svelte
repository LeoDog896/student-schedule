<script lang="ts">
	interface Student {
		id: string;
		firstName: string;
		lastName: string;
		class: 2024;
		present: boolean;
	}

	let students: Student[] = [
		{
			id: crypto.randomUUID(),
			firstName: 'John',
			lastName: 'Doe',
			class: 2024,
			present: false
		}
	];
</script>

<table>
	<thead>
		<tr>
			<th>Student ID</th>
			<th>First Name</th>
			<th>Last Name</th>
			<th>Class</th>
			<th>Present?</th>
		</tr>
	</thead>
	<tbody>
		{#each students as student}
			<tr>
				<td>{student.id}</td>
				<td>{student.firstName}</td>
				<td>{student.lastName}</td>
				<td>{student.class}</td>
				<td class:present={student.present} class:absent={!student.present}>
					{student.present ? 'Present' : 'Absent'}
					<input type="checkbox" bind:checked={student.present} />
				</td>
			</tr>
		{/each}
	</tbody>
</table>

<style>
	table {
		border-collapse: collapse;
		width: 100%;
	}

	th,
	td {
		padding: 0.5rem;
		border: 1px solid #ccc;
	}

	th {
		background-color: #eee;
	}

	tr:nth-child(even) {
		background-color: #f2f2f2;
	}

	tr:hover {
		background-color: #ddd;
	}

	.present {
		background-color: #b3ffb3;
	}

	.absent {
		background-color: #ffb3b3;
	}
</style>
