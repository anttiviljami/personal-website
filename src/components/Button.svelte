<script>
  export let link;
  export let target = undefined;
  export let title = undefined;
</script>

<style>
  .button {
    background: transparent;
    border: 1px solid #ccc;
    padding: 1rem;
    min-width: 6rem;
    border-radius: .25rem;
    color: #333;
    transition: .5s;
    box-sizing: border-box;
    display: inline-block;
    text-align: center;
    flex-grow: 1;
    margin: 0 .5rem .5rem 0;
  }
  .button:hover {
    color: #8fd3d2;
    border-color: #8fd3d2;
    text-decoration: none;
  }
  @media screen and (max-width: 50rem) {
    .button {
      min-width: 100%;
      padding: .5rem;
    }
  }
</style>

<a class="button" href={link} target={target} title={title} on:click={(e) => e.stopPropagation()}>
  <slot></slot>
</a>
