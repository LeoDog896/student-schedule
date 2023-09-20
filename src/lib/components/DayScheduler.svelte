<script lang="ts">
	import Activity from './Activity.svelte';
	type activityList = [
		{
			//idk what to put here
			//essentially a list of activities containing the name, start time, end time, and day based on the selected start day
		}
	];

	//constant stuff
	const weekdays = ['Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday'];
	export let visibleDays: number;
	export let startDay: Date;

	$: console.log(startDay);

	//functions
	let fixDate = (addDays: number) => {
		console.log(startDay.getDay());
		let newDate = new Date(startDay.getTime() + addDays * 24 * 60 * 60 * 1000);
		let day = newDate.getDate();
		let weekday = newDate.getDay();

		return `${weekdays[weekday]}, ${day}`;
	};
</script>

<div class="wrap">
	<div class="days">
		{#each Array(visibleDays) as day, i}
			<div class="day">
				<p>{fixDate(i)}</p>
				<!-- Temporary, for display only -->
				{#if i % 2 == 0}
					<Activity />
				{:else}
					<button>Join Activity</button>
				{/if}
			</div>
		{/each}
	</div>
</div>

<style>
	.wrap {
		width: 100%;
		height: 100%;
	}
	.days {
		display: flex;
		flex-direction: row;
		width: 100%;
		height: 100%;
	}
	.day {
		width: 100%;
		display: flex;
		flex-direction: column;
		align-items: center;
		position: relative;
	}
	.day::before {
		content: '';
		position: absolute;
		width: 100%;
		height: 100%;
		outline: 1px solid var(--textDark);
		opacity: 0.2;
	}
</style>
