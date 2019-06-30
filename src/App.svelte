<script>
  import Card from './components/Card.svelte';
  import Button from './components/Button.svelte';

  const github = 'anttiviljami';
  const twitter = 'anttiviljami';
  const linkedin = 'anttiviljami';
  const email = 'viljami@avoinsorsa.fi';

  let flipped = false;
  const flip = () => flipped = !flipped;
</script>

<style>
  .main-wrapper {
    display: flex;
    justify-content: center;
    align-items: center;
    width: 100%;
    height: 100%;
    overflow-x: hidden;
    overflow-y: scroll;
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
  }
  p.title {
    letter-spacing: .25rem;
    text-transform: uppercase;
  }
  .morjesta {
    display: flex;
    justify-content: center;
    align-items: center;
    min-width: 100%;
    min-height: 100%;
    text-align: center;
  }
  .morjesta h1 {
    font-size: 4em;
    letter-spacing: .25rem;
  }
  .morjesta p {
    color: #ccc;
  }
  @media screen and (max-width: 50rem) {
    h1, .morjesta h1 {
      font-size: 2rem;
    }
    .links {
      display: flex;
      flex-wrap: wrap;
    }
  }
</style>

<div class="main-wrapper">
  {#if !flipped}
  <Card first image="./images/anttiviljami.jpg" onFlip={flip}>
    <div class="intro">
      <h1 class="heading">Viljami Kuosmanen</h1>
      <p class="title">Developer, Consultant</p>
      <p>Hi there! My name is Viljami and I'm a cloud native developer who solves business problems.</p>
      <p>You might know me from one of my open source projects or heard me speaking about APIs and Developer Experience in your local meetup or tech conference.</p>
      <p>Right now I work with AWS, Azure, Serverless, TypeScript, React, OpenAPI and GraphQL; but these are just tools I've picked up over the past 8 years working in consultancy and tech startups. I'm not particularly passionate about any single technology but rather I'm looking to build cool things with talented people.</p>
      <p>How can I help you?</p>
    </div>
    <div class="links">
      <Button link="https://github.com/{github}" target="_blank">Github</Button>
      <Button link="https://twitter.com/{twitter}" target="_blank">Twitter</Button>
      <Button link="https://linkedin.com/in/{linkedin}" target="_blank">LinkedIn</Button>
      <Button link="mailto:{email}">Email</Button>
    </div>
  </Card>
  {:else}
  <Card onFlip={flip}>
    <div class="morjesta">
      <div>
        <h1>Morjesta!</h1>
        <p>("Hi" in Tampere-speak)</p>
      </div>
    </div>
  </Card>
  {/if}
</div>
