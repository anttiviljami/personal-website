<script>
	import Card from './components/Card.svelte';
	import Button from './components/Button.svelte';

	const github = 'anttiviljami';
	const twitter = 'anttiviljami';
	const linkedin = 'anttiviljami';
	const email = 'viljami@avoinsorsa.fi';
</script>

<style>
	.main-wrapper {
		display: flex;
		justify-content: center;
		align-items: center;
		min-width: 100%;
		min-height: 100%;
	}
	h1 {
		font-size: 3rem;
		margin: 0;
		line-height: 1;
	}
	h1,h2,h3,p {
		margin-bottom: 1rem;
	}
	* { line-height: 1.4 }
	.intro {
		flex-grow: 1;
		margin-bottom: 1.5rem;
	}
	.links {
		display: flex;
		margin: 0 -.5rem;
	}
	p.title {
		letter-spacing: .25rem;
		text-transform: uppercase;
	}
  @media screen and (max-width: 50rem) {
		h1 {
			font-size: 2rem;
		}
		.links {
			flex-direction: column;
		}
	}
</style>

<div class="main-wrapper">
	<Card image="./images/anttiviljami.jpg">
		<div class="intro">
			<h1 class="heading">Viljami Kuosmanen</h1>
			<p class="title">Developer, Consultant</p>
			<p>Hi there! My name is Viljami and I'm a cloud native developer who solves business problems.</p>
			<p>Right now I work with AWS, Azure, Serverless, TypeScript, React, OpenAPI and GraphQL but these are just tools I've picked up over the past 8 years.</p>
			<p>I'm not particularly passionate about any single technology but rather my interests lie in Open Source and Developer Experience.</p>
		</div>
		<div class="links">
			<Button link="https://github.com/{github}" target="_blank">Github</Button>
			<Button link="https://twitter.com/{twitter}" target="_blank">Twitter</Button>
			<Button link="https://linkedin.com/in/{linkedin}" target="_blank">LinkedIn</Button>
			<Button link="mailto:{email}">Email</Button>
		</div>
	</Card>
</div>
