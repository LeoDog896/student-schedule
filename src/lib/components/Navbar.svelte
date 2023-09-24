<script>
</script>

<nav>
	<a class="siteName" href="/"><h1>Site Name</h1></a>
	<div class="buttons">
		<a href="/admin" class="button">Admin</a>
		<a href="/teacher/attendance" class="button">Teacher</a>
		<a href="/schedule" class="button">Schedule</a>
		<a href="/attendance" class="button">Attendance</a>
		<a href="/help" class="button">Help</a>
	</div>
</nav>

<style>
	nav {
		width: 100%;
		height: 50px;
		background-color: var(--accent1);
		color: var(--textLight);
		display: flex;
		flex-direction: row;
		flex-wrap: nowrap;
	}
	.siteName {
		text-decoration: none;
		color: var(--textLight);
	}
	nav h1 {
		margin: 0px;
		line-height: 50px;
		white-space: nowrap;
		overflow: visible;
		padding: 0px 20px;
		box-sizing: border-box;
	}
	nav .buttons {
		display: flex;
		flex-direction: row;
		width: 100%;
		justify-content: flex-end;
		padding: 0px 20px;
		box-sizing: border-box;
		align-items: center;
	}
	.button {
		flex-direction: row;
		position: relative;
		align-items: center;
		justify-content: center;
		margin: 0 10px;
		text-decoration: none;
		color: var(--textLight);
		font-size: 1.1rem;
	}
	.button::after {
		content: '';
		position: absolute;
		bottom: 0;
		left: 0;
		width: 100%;
		height: 1px;
		background-size: 300%;
		background-position: 100%;
		background-image: linear-gradient(
			90deg,
			var(--textLight),
			var(--textLight) 34%,
			transparent 65%,
			transparent
		);
		transition: background-position 0.3s ease-in-out;
	}
	.button:hover::after {
		background-position: 0%;
		transition: background-position 0.3s ease-in-out;
	}
</style>
