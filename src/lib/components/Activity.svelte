<div class="wrap">
	<h2>Dylan's Study Block</h2>
	<div class="row"><img src="/icons/instructor.svg" alt="instructor"/><p>Dylan Myers</p></div>
	<div class="row"><img src="/icons/location.svg" alt="location"/><p>Room 131</p></div>
	<div class="row"><img src="/icons/group.svg" alt="location"/><p>17/20</p></div>
	<div class="row"><img src="/icons/activity.svg" alt="location"/><p>Tutoring</p></div>
</div>

<style>
	.wrap {
		width: 90%;
		position: relative;
		color: var(--textDark);
		padding: 10px;
		box-sizing: border-box;
	}
	.wrap h2 {
		margin: 0px;
	}
	.wrap p {
		margin: 0px;
	}
	.wrap::after {
		content: "";
		position: absolute;
		bottom: 0;
		left: 0;
		width: 100%;
		height: 100%;
		background: var(--blue);
		opacity: 0.2;
		z-index: -1;
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