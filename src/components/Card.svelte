<script>
	import { fade, fly } from 'svelte/transition';
  export let onFlip = undefined;
  export let image = undefined;
  export let imageAlt = '';
  export let first = false;
  export let tiltX = 0;
  export let tiltY = 0;
  let moves = 0;
  const tiltEffect = (tiltX, tiltY) => { 
    const dist = (x, y) => Math.sqrt(Math.pow(x, 2) + Math.pow(y, 2));
    let styles = [];
    styles.push(`transform: rotate3d(${tiltX}, ${tiltY}, 0, ${dist(tiltX, tiltY)}turn)`);
    styles.push(`box-shadow: ${-1000 * tiltY * dist(tiltX, tiltY)}rem ${1000 * tiltX * dist(tiltX, tiltY)}rem 2rem rgba(0,0,0,.4)`);
    if (tiltX === 0 && tiltY === 0) {
      moves = 0;
    }
    let inertia = .5 * (35 - moves) / 100;
    if (inertia < 0) {
      inertia = 0;
    }
    styles.push(`transition: box-shadow ${inertia}s linear, transform ${inertia}s linear;`)
    moves++;
    return styles.join(';')
  }
</script>

<style>
  .card-container {
    width: 100%;
    display: flex;
    justify-content: center;
  }
  .card-container + .card-container {
    position: absolute;
  }
  .card {
    display: flex;
    position: relative;
    max-width: 90%;
    width: 60rem;
    min-height: 32rem;
    background: white;
    overflow: hidden;
    flex-basis: 1;
  }
  .image {
    width: 20rem;
    overflow: hidden;
    background-size: cover;
    flex-shrink: 0;
    flex-basis: 1;
    background-position: top center;
  }
  .image img {
    width: 100%;
    height: 100%;
    object-fit: cover;
    object-position: top;
  }
  .content {
    flex-grow: 1;
    flex-basis: 1;
    padding: 2rem;
    display: flex;
    flex-direction: column;
  }
  @media screen and (max-width: 50rem) {
    .card {
      flex-wrap: wrap;
      width: 28rem;
      min-height: 18rem;
    }        
    .image, .content {
      width: 100%;
    }
    .image {
      flex-grow: 1;
      max-height: 20rem;
    }
  }
  .flip {
    width: 4rem;
    height: 4rem;
    border-left: 1px solid rgba(0,0,0,.1);
    position: absolute;
    right: -2rem;
    bottom: -2rem;
    transform: rotate(45deg);
    transform-origin: center;
    cursor: pointer;
  }
  .first .flip {
    animation-name: glow;
    animation-duration: 10s;
    animation-play-state: running;
    animation-iteration-count: infinite;
  }
  @keyframes glow {
    0%   {background-color:rgba(143,211,210,0);border-color:rgba(0,0,0,.1)}
    40%  {background-color:rgba(143,211,210,0);border-color:rgba(0,0,0,.1)}
    45%  {background-color:rgba(143,211,210,1);border-color:rgba(0,0,0,0)}
    50%  {background-color:rgba(143,211,210,0);border-color:rgba(0,0,0,.1)}
    55%  {background-color:rgba(143,211,210,1);border-color:rgba(0,0,0,0)}
    60% {background-color:rgba(143,211,210,0);border-color:rgba(0,0,0,.1)}
  }
</style>

<div
  class="card-container"
  in:fly={{ y: 200, duration: 600, delay: 200 }}
  out:fly={{y: -100, duration: 600 }}
>
  <div
    class="card {first ? 'first' : ''}"
    style={tiltEffect(tiltX, tiltY)}
    >
    {#if image}
    <div class="image" >
      <img src={image} alt={imageAlt} />
    </div>
    {/if}
    <div class="content">
      <slot></slot>
      <div class="flip" on:click={onFlip}></div>
    </div>
  </div>
</div>