<script>
  import Card from './components/Card.svelte';
  import Button from './components/Button.svelte';

  const email = 'viljami@avoinsorsa.fi';
  const github = 'anttiviljami';
  const twitter = 'anttiviljami';
  const linkedin = 'anttiviljami';
  const keybase = 'anttiviljami';
  const fingerprint = '40EA BFC7 ECA2 71E4 EECB 4AC4 1834 53EB 5722 2BE7'.split(' ');

  const tools = [
    'AWS',
    'Azure',
    'Serverless',
    'Docker',
    'TypeScript',
    'React',
    'GraphQL',
    'OpenAPI',
  ];

  let flipped = false;
  const flip = () => flipped = !flipped;

  let tiltX = 0;
  let tiltY = 0;
  function handleMousemove (event) {
    if (window.innerWidth > 800) {
      const centerX = window.innerWidth / 2;
      const centerY = window.innerHeight / 2;
      tiltY = -.025 * (centerX - event.clientX) / centerX;
      tiltX = .05 * (centerY - event.clientY) / centerY;
    } else {
      tiltX = 0;
      tiltY = 0;
    }
  }

  function handleMouseleave (event) {
    tiltX = 0;
    tiltY = 0;
  }
</script>

<style>
  .main-wrapper {
    display: flex;
    width: 100%;
    height: 100%;
    flex-wrap: wrap;
  }
  .inner {
    margin: 2rem 0;
    display: flex;
    justify-content: center;
    align-items: center;
    flex-wrap: wrap;
    width: 100%;
  }
  h1 {
    font-size: 3rem;
    margin: 0;
    line-height: 1;
  }
  h1,p {
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
    font-size: 4.5em;
    letter-spacing: .25rem;
  }
  .pgp span {
    margin: 0 .15rem;
    letter-spacing: .05rem;
  }
  @media screen and (max-width: 50rem) {
    h1 {
      font-size: 2rem;
    }
    .morjesta h1 {
      font-size: 2.2rem;
      letter-spacing: 0;
    }
    .pgp span:nth-child(5n)::after {
      content: "\A";
      white-space: pre;
    }
    .links {
      display: flex;
      flex-wrap: wrap;
    }
    .main-wrapper {
      display: block;
    }
    .inner {
      align-items: flex-start;
      padding-bottom: 2rem;
    }
  }
</style>

<div class="main-wrapper" on:mousemove={handleMousemove} on:mouseleave={handleMouseleave}>
  <div class="inner">
  {#if !flipped}
    <Card first image="./images/anttiviljami.jpg" onFlip={flip} tiltX={tiltX} tiltY={tiltY}>
      <div class="intro">
        <h1 class="heading">Viljami Kuosmanen</h1>
        <p class="title">Senior Developer, Consultant</p>
        <p>Hi there! My name is Viljami. I'm a cloud native developer who loves board games and solves business problems.</p>
        <p>You might know me from one of my open source projects or perhaps heard me speaking about APIs and Developer Experience at your local meetup or tech conference.</p>
        <p>Right now I'm working with {tools.join(', ')} and many others. But these are just tools I've picked up over the past 7 years working in tech consultancy and startups. I'm not particularly passionate about any single technology but rather looking to build cool things with talented people.</p>
        <p>But enough about me. How can I help you?</p>
      </div>
      <div class="links">
        <Button link="mailto:{email}" title={email}>Email</Button>
        <Button link="https://github.com/{github}" title="github.com/{github}" target="_blank">Github</Button>
        <Button link="https://linkedin.com/in/{linkedin}" title="linkedin.com/in/{linkedin}" target="_blank">LinkedIn</Button>
        <Button link="https://twitter.com/{twitter}" title="twitter.com/{twitter}" target="_blank">Twitter</Button>
        <!--<Button link="https://keybase.io/{keybase}" target="_blank">Keybase</Button>-->
      </div>
    </Card>
  {:else}
    <Card onFlip={flip} tiltX={tiltX} tiltY={tiltY}>
      <div class="morjesta">
        <div>
          <h1>@anttiviljami</h1>
          <p class="pgp" title="PGP Fingerprint">
            {#each fingerprint as hex}
            <span>{hex}</span>
            {/each}
          </p>
        </div>
      </div>
    </Card>
  {/if}
  </div>
</div>
