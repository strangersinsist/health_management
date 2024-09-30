<template>
  <div class="card">
    <h2>{{ card.title }}</h2>
    <img :src="card.image" alt="描述图片">
    <p>{{ card.content }}</p>
    <div class="meta">
      <span>适宜时间: {{ card.time }}</span>
      <span>适宜心率: {{ card.heart }}</span>
      <span>适宜频率: {{ card.freq }}</span>
      <span>推荐速度: {{ card.velocity }}</span>

    </div>
  </div>
</template>

<script>
import index from "vuex";

export default {
  computed: {
    index() {
      return index
    }
  },
  props: {
    card: {
      type: Object,
      required: true
    }
  }
};
</script>

<style scoped>
.card {
  border: 8px double lightblue;
  border-radius: 10px;
  border-width: 20px;
  height: 200px;
  padding: 10px;
  margin-bottom: 10px;
  background-color: white;
}
.card h2{
  display: block; /* 将文本包装在块级元素中 */
  text-align: center; /* 文本水平居中 */
  font-family:SimHei,sans-serif;
  color:darkblue;
}
.card img{
  height:65px;
  width:65px;
  margin-left: 120px;
}
.card p{
  display: block; /* 将文本包装在块级元素中 */
  text-align: center; /* 文本水平居中 */
  font-size:larger;
  font-weight:bolder;
}
.meta {
  margin-top: 20px;
}

.meta span {
  display: block;
  margin-right: 20px;
  margin-left:50px;
  font-size:large;
}
</style>