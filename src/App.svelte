<script>
  import Card from './components/Card.svelte';
  import Button from './components/Button.svelte';

  const email = 'viljami@viljami.io';
  const github = 'anttiviljami';
  const twitter = 'anttiviljami';
  const linkedin = 'anttiviljami';
  const keybase = 'anttiviljami';
  const buymeacoffee = 'anttiviljami';
  const calendly = 'viljami';
  const fingerprint = '14F9 2B1C 77B2 84FA 99FB 33E0 BAD3 0743 AD50 F3C8';

  const tools = [
    'TypeScript',
    'Python',
    'AWS',
    'Serverless',
    'OpenAPI',
    'tRPC',
    'Svelte',
    'React',
    'Elasticsearch',
  ];

  let flipped = false;
  let tiltX = 0;
  let tiltY = 0;

  const handleMousemove = (event) => {
    if (!flipped) {
      return (tiltX = 0);
      return (tiltY = 0);
    }
    if (window.innerWidth > 800) {
      const centerX = window.innerWidth / 2;
      const centerY = window.innerHeight / 2;
      tiltY = (-0.025 * (centerX - event.clientX)) / centerX;
      tiltX = (0.05 * (centerY - event.clientY)) / centerY;
    } else {
      tiltX = 0 + 0.0000001 * event.clientX;
      tiltY = 0 + 0.0000001 * event.clientY;
    }
  };

  const handleMouseleave = (event) => {
    tiltX = 0;
    tiltY = 0;
  };

  const flip = (event) => {
    flipped = !flipped;
    // safari fix for weird absolute positioning during transition
    window.setTimeout(
      () =>
        handleMousemove({
          clientY: event.clientY,
          clientX: event.clientX + 0.0001,
        }),
      0,
    );
    window.setTimeout(
      () =>
        handleMousemove({
          clientY: event.clientY,
          clientX: event.clientX - 0.0001,
        }),
      200,
    );
    window.setTimeout(
      () => handleMousemove({ clientY: event.clientY, clientX: event.clientX }),
      400,
    );

    const scroll = new SmoothScroll();
    scroll.animateScroll(0);
  };
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
  h1,
  p {
    margin-bottom: 1rem;
  }
  * {
    line-height: 1.4;
  }
  .intro {
    flex-grow: 1;
  }
  ul.icons {
    display: flex;
    padding-left: 0;
    list-style: none;
    padding: 0;
  }
  ul.icons li {
    line-height: 1.5;
    margin-right: 1rem;
  }
  ul.icons img {
    max-width: 25px;
    filter: opacity(0.66);
  }
  ul.icons a:hover img {
    filter: opacity(1);
  }
  h1.heading {
    letter-spacing: 0.1rem;
  }

  p.title {
    letter-spacing: 0.25rem;
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
    letter-spacing: 0.25rem;
  }
  .pgp a {
    color: #111;
  }
  .pgp span {
    margin: 0 0.15rem;
    letter-spacing: 0.05rem;
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
      content: '\A';
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

<div
  class="main-wrapper"
  on:mousemove={handleMousemove}
  on:mouseleave={handleMouseleave}>
  <div class="inner">
    {#if !flipped}
      <Card
        first
        image="./images/anttiviljami.jpg"
        onFlip={flip}
        {tiltX}
        {tiltY}>
        <div class="intro">
          <h1 class="heading">Viljami Kuosmanen</h1>
          <p class="title">Product Engineer</p>
          <p>
            I'm a software engineer with 15+ years of experience, Head of
            Engineering at
            <a href="https://epilot.cloud/en" target="_blank">epilot.cloud</a>
            and Open Source maintainer of
            <a href="https://openapistack.co" target="_blank">
              openapistack.co
            </a>
          </p>
          <p>
            Most recently I'm building with
            <i>{tools.join(', ')}</i>
            to name a few of my favourites – Tools I've picked up over years
            building software, mostly on the web.
          </p>
          <p>
            I consider myself a
            <a href="https://productengineer.org" target="_blank">
              product engineer,
            </a>
            not partial to any single tool or technology but always looking to
            work with ambitious, fun people to build great products together.
          </p>
          <p>But enough about me. How can I help you?</p>
          <ul class="icons">
            <li>
              <a href="https://github.com/{github}" target="_blank">
                <img
                  src="https://img.icons8.com/material-sharp/96/000000/github.png"
                  alt="GitHub" />
              </a>
            </li>
            <li>
              <a href="https://linkedin.com/in/{linkedin}" target="_blank">
                <img
                  src="https://img.icons8.com/?size=64&id=8808&format=png"
                  alt="LinkedIn" />
              </a>
            </li>
            <li>
              <a href="mailto:{email}">{email}</a>
            </li>
          </ul>
        </div>
        <div class="links">
          <!--<Button link="https://keybase.io/{keybase}" target="_blank">Keybase</Button>-->
          <!--<Button link="mailto:{email}" title="Email" target="_blank">Email me</Button>-->
          <Button link="/portfolio.pdf" target="_blank">View Portfolio</Button>
          <Button link="https://calendly.com/{calendly}" target="_blank">
            Schedule a Meeting
          </Button>
          <!--<Button link="https://buymeacoff.ee/{buymeacoffee}" target="_blank">
            Buy me a Coffee
          </Button>-->
        </div>
      </Card>
    {:else}
      <Card onFlip={flip} {tiltX} {tiltY}>
        <div class="morjesta">
          <div>
            <h1>@anttiviljami</h1>

            <p class="pgp" title="PGP Fingerprint">
              <a href="https://keybase.io/{keybase}" target="_blank">
                <span>{fingerprint}</span>
              </a>
            </p>
          </div>
        </div>
      </Card>
    {/if}
  </div>
</div>
