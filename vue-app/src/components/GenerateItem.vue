<script>
export default {
  data() {
    return {
      word: ""
    }
  },
  methods: {
    request() {
      // update component state
      fetch("http://localhost:8080/word", { 
    		method: "POST",
    		headers: { "Content-Type": "application/json" }
		})
        .then(response => {
			return response.json();
			})
        .then(data => (this.word = data.word.toUpperCase()));
    }
  }
}
</script>

<template>
  <div class="item">
  	<button v-on:click="request" class="button">NEW</button>
  </div>
  <div class="greetings">
    <h2>
      Generated word: 
    </h2>
	<h1 class="green">{{ word }} </h1>
  </div>
</template>

<style scoped>
h1 {
  font-weight: 500;
  font-size: 2.6rem;
  top: -10px;
}

h3 {
  font-size: 1.2rem;
}

h2 {
  font-size: 1.2rem;
  font-weight: 500;
  margin-bottom: 0.4rem;
  color: var(--color-heading);
}
.button {
  background-color: #555555; /* Black */
  border: 1px;
  color: white;
  padding: 5px 32px;
  text-decoration: none;
  font-size: 1rem;
  border-radius: 2px;
  border: 1px solid #4CAF50; /* Green */
}

.button:hover {
  background-color: #4CAF50; /* Green */
  color: white;
}

.greetings h1,
.greetings h3 {
  text-align: center;
}

@media (min-width: 1024px) {
  .greetings h1,
  .greetings h3 {
    text-align: left;
  }
}

.item {
  margin-top: 2rem;
  display: flex;
  text-align: center;
}

.details {
  flex: 1;
  margin-left: 1rem;
}

i {
  display: flex;
  place-items: center;
  place-content: center;
  width: 32px;
  height: 32px;

  color: var(--color-text);
}

h3 {
  font-size: 1.2rem;
  font-weight: 500;
  margin-bottom: 0.4rem;
  color: var(--color-heading);
}

@media (min-width: 1024px) {
  .item {
    margin-top: 0;
    padding: 0.4rem 0 1rem calc(var(--section-gap) / 2);
  }

  i {
    top: calc(50% - 25px);
    left: -26px;
    position: absolute;
    border: 1px solid var(--color-border);
    background: var(--color-background);
    border-radius: 8px;
    width: 50px;
    height: 50px;
  }

  .item:before {
    content: ' ';
    border-left: 1px solid var(--color-border);
    position: absolute;
    left: 0;
    bottom: calc(50% + 25px);
    height: calc(50% - 25px);
  }

  .item:after {
    content: ' ';
    border-left: 1px solid var(--color-border);
    position: absolute;
    left: 0;
    top: calc(50% + 25px);
    height: calc(50% - 25px);
  }

  .item:first-of-type:before {
    display: none;
  }

  .item:last-of-type:after {
    display: none;
  }
}
</style>
