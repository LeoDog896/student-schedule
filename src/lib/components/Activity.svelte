<script lang="ts">
	import type { Activity as ActivityType } from './activities';

	export let activity: ActivityType;
</script>

<div class="wrap">
	<h2>{activity.name}</h2>
	<div class="row">
		<img src="/icons/instructor.svg" alt="instructor" />
		<p>{activity.leader}</p>
	</div>
	<div class="row">
		<img src="/icons/location.svg" alt="location" />
		<p>{activity.location}</p>
	</div>
	<div class="row">
		<img src="/icons/group.svg" alt="location" />
		<p>{activity.signups}/{activity.capacity}</p>
	</div>
	<div class="row">
		<img src="/icons/activity.svg" alt="location" />
		<p>{activity.type}</p>
	</div>
</div>

<style>
	.wrap {
		width: 90%;
		position: relative;
		color: var(--textDark);
		padding: 10px;
		box-sizing: border-box;
		border: 3px;
	}
	.wrap h2 {
		margin: 0px;
	}
	.wrap p {
		margin: 0px;
	}
	.wrap::after {
		content: '';
		position: absolute;
		bottom: 0;
		left: 0;
		width: 100%;
		height: 100%;
		background: var(--blue);
		opacity: 0.2;
		z-index: -1;
		border: 3px;
	}
	.row {
		display: flex;
		flex-direction: row;
		align-items: center;
	}
	.row img {
		width: 20px;
		height: 20px;
		margin-right: 5px;
		opacity: 0.7;
	}
</style>
