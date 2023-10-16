<script>
	import Attendance from '$lib/components/Attendance/Attendance.svelte';
	import NumberCode from '$lib/components/Attendance/NumberCode.svelte';
</script>

<svelte:head>
	<title>Attendance Management</title>
</svelte:head>

<div class="container">
	<NumberCode />
	<Attendance />
</div>

<style>
	.container {
		display: flex;
		flex-direction: row;
	}
</style>