<script>
	import Navbar from '$lib/components/Navbar.svelte';
</script>

<div class="wrap">
	<Navbar />
	<div class="content">
		<slot />
	</div>
</div>

<style>
	@import url('https://use.typekit.net/ypw7fxj.css');
	:global(body) {
		font-family: 'proxima-nova', sans-serif;
		--bodyColor: #f1f1f1;
		--textDark: #333;
		--textLight: #fff;
		--accent1: #333;
		--accent2: #e1e1e1;
		--blue: #0064c1;
		--blueHover: #0078e9;
		--blueActive: #0057a8;
		margin: 0;
		background: var(--bodyColor);
	}

	.wrap {
		display: flex;
		flex-direction: column;
		justify-content: start;
		height: 100vh;
		width: 100%;
	}
	.content {
		flex-grow: 1;
		width: 100%;
		height: 100%;
	}
</style>
