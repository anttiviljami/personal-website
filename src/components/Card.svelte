<script>
	import { fade, fly } from 'svelte/transition';
  export let onFlip = undefined;
  export let image = undefined;
  export let imageAlt = '';
  export let first = false;
</script>

<style>
  .card {
    display: flex;
    position: relative;
    max-width: 90%;
    width: 60rem;
    min-height: 32rem;
    box-shadow: 0 0 2rem rgba(0,0,0,.4);
    background: white;
    overflow: hidden;
    flex-basis: 1;
  }
  .card + .card {
    position: absolute;
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
      min-height: 22rem;
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

<div class="card {first ? 'first' : ''}" on:click in:fly={{ y: 200, duration: 600, delay: 200 }} out:fly={{y: -100, duration: 600 }}>
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
