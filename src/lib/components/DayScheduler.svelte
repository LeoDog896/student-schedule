<script lang="ts">
	import type { Stores } from 'svelte/store';
	import Activity from './Activity.svelte';
	import ActivityModal from './ActivityModal.svelte';
	import { fetchActivities } from './activities';
	type activityList = [
		{
			// idk what to put here
			// essentially a list of activities containing the name, start time, end time, and day based on the selected start day
		}
	];

	// constant stuff
	const weekdays = ['Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday'];
	export let visibleDays: number;
	export let startDay: Date;
	let activeModal = false;

	let toggleModal = () => {
		activeModal = !activeModal;
	};

	//functions
	let fixDate = (addDays: number) => {
		let newDate = new Date(startDay.getTime() + addDays * 24 * 60 * 60 * 1000);
		let day = newDate.getDate();
		let weekday = newDate.getDay();

		return `${weekdays[weekday]}, ${day}`;
	};
</script>

<ActivityModal bind:show={activeModal} />

<div class="wrap">
	<div class="days">
		{#each Array(visibleDays) as day, i}
			<div class="day">
				<p>{fixDate(i)}</p>
				<!-- Temporary, for display only -->
				{#if i % 2 == 0}
					<Activity activity={fetchActivities()[Math.floor(i / 2)]} />
				{/if}
				<button class="button" on:click={toggleModal}>Join Activity</button>
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
		top: 0px;
		right: 0px;
		width: 1px;
		height: 100%;
		background: var(--textDark);
		opacity: 0.2;
	}
	button {
		margin: 10px 0px;
		position: relative;
		padding: 10px 30px;
		background: transparent;
		border: none;
		color: var(--textDark);
		font-size: 1.1rem;
		z-index: 3;
		cursor: pointer;
		border-radius: 3px;
	}

	button::after {
		content: '';
		position: absolute;
		top: 0;
		left: 0;
		z-index: -1;
		width: 100%;
		height: 100%;
		border-radius: 3px;
		background: var(--blue);
		transform-origin: left;
		opacity: 0.2;
		border-radius: 3px;
	}
	button:hover::after {
		opacity: 0.5 !important;
	}
</style>
