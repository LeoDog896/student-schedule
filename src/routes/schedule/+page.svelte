<script lang="ts">
	import { get, writable } from 'svelte/store';
	import DayScheduler from '$lib/components/DayScheduler.svelte';

	//types
	type selectedViewString = 'day' | '5day' | 'week' | 'month';

	//variables
	let selectedView: selectedViewString = '5day';
	let visibleDays = 5;
	let startDay = new Date();

	//the other stuff
	let updateView = (selected: MouseEvent) => {
		let buttonId = (selected.target as HTMLButtonElement).id;
		if (buttonId == '1daypick') {
			selectedView = 'day';
			visibleDays = 1;
			startDay = new Date();
		} else if (buttonId == '5daypick') {
			selectedView = '5day';
			visibleDays = 5;
			startDay = new Date();
		} else if (buttonId == 'weekpick') {
			selectedView = 'week';
			visibleDays = 5;
			//change the start day to the start of the week
			startDay = new Date(
				Date.now() - new Date().getDay() * 24 * 60 * 60 * 1000 + 1 * 24 * 60 * 60 * 1000
			);
		} else if (buttonId == 'monthPick') {
			selectedView = 'month';
			visibleDays = 0;
			startDay = new Date();
		}
	};

	let resetStartDay = () => {
		visibleDays = 1;
		startDay = new Date();
	};
</script>

<svelte:head>
	<title>Student Schedule</title>
</svelte:head>

<div class="wrap">
	<div class="display">
		{#key selectedView}
			<DayScheduler {visibleDays} {startDay} />
		{/key}
	</div>
	<div class="controlBar">
		<div class="dayPicker">
			<button on:click={resetStartDay}>Focus Today</button>
			<!-- date picker -->
		</div>
		<div class="viewPicker">
			<button class:buttonActive={selectedView == 'day'} id="1daypick" on:click={updateView}
				>Day</button
			>
			<button class:buttonActive={selectedView == '5day'} id="5daypick" on:click={updateView}
				>5 Day</button
			>
			<button class:buttonActive={selectedView == 'week'} id="weekpick" on:click={updateView}
				>Week</button
			>
			<button class:buttonActive={selectedView == 'month'} id="monthPick" on:click={updateView}
				>Month</button
			>
		</div>
	</div>
</div>

<style>
	.wrap {
		width: 100%;
		height: 100%;
		display: flex;
		flex-direction: column;
	}
	.display {
		height: 100%;
		flex-grow: 2;
		flex-direction: row;
	}
	.controlBar {
		display: flex;
		flex-direction: row;
		justify-content: space-between;
		align-items: center;
		width: 100%;
		height: 50px;
		color: var(--textLight);
		background: var(--accent2);
		padding: 0px 20px;
		box-sizing: border-box;
	}
	.viewPicker {
		display: flex;
		flex-direction: row;
		border: 0px;
	}
	button {
		position: relative;
		padding: 10px 30px;
		background: transparent;
		border: none;
		color: var(--textDark);
		font-size: 1.1rem;
		z-index: 3;
		cursor: pointer;
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
	}
	button:hover {
		color: var(--textLight);
	}
	button:hover::after {
		opacity: 1 !important;
	}
	.buttonActive::after {
		opacity: 0.5 !important;
	}
</style>
