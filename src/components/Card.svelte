<script>
  export let image;
</script>

<style>
  .card {
    display: flex;
    max-width: 100%;
    width: 60rem;
    min-height: 25rem;
    box-shadow: 0 0 2rem rgba(0,0,0,.4);
    background: white;
    margin: 2.5rem;
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
      margin: 1rem;
    }        
    .image, .content {
      width: 100%;
    }
    .image {
      min-height: 20rem;
    }
  }
</style>

<div class="card">
  <div class="image" style="background-image:url({image})" />
  <div class="content">
    <slot></slot>
  </div>
</div>
