
<template>
  <div class="totalcard">

    <div class="container">
      <div class="card">
        <Card :card="cardData1" />
      </div>
      <div class="card">
        <Card :card="cardData2" />
      </div>
      <div class="card">
        <Card :card="cardData3" />
      </div>

      <div class="card">
        <Card :card="cardData4" />
      </div>
      <div class="card">
        <Card :card="cardData5" />
      </div>
      <div class="card">
        <Card :card="cardData6" />
      </div>

      <div class="card">
        <Card :card="cardData7" />
      </div>
      <div class="card">
        <Card :card="cardData8" />
      </div>

    </div>
  </div>
</template>

<script>
  import Card from '@/components/Card.vue';

  export default {
  components: {
  Card
},
  data() {
    return {
      cardData1: {
        title: '瑜伽',
        image: require('@/assets/瑜伽.png'),
        content: '"静心塑形 优雅buff叠满"',
        time: '60分钟',
        heart: '90-110次/分',
        freq: '1~2次/周',
        velocity: '无',
        index: 1
      },
      cardData2: {
        title: '游泳',
        image: require('@/assets/游泳.png'),
        content: '"清爽凉快 夏天适配度100%"',
        time: '30-60分钟',
        heart: '80-110次/分',
        freq: '2~3次/周',
        velocity: '2-5分/100米'
      },
      cardData3: {
        title: '骑行',
        image: require('@/assets/骑行.png'),
        content: '"速度七十迈 心情自由自在"',
        time: '30-60分钟',
        heart: '110-130次/分',
        freq: '3~5次/周',
        velocity: '20-28km/h'
      },
      cardData4: {
        title: '慢跑',
        image: require('@/assets/跑步.png'),
        content: '"感受风 拥抱风"',
        time: '20-40分钟',
        heart: '100-150次/分',
        freq: '3~5次/周',
        velocity: '5~8km/h'
      },
      cardData5: {
        title: '羽毛球',
        image: require('@/assets/羽毛球.png'),
        content: '"好想变得和羽毛球一样轻盈"',
        time: '1-2小时',
        heart: '80-180次/分',
        freq: '1~2次/周',
        velocity: '无'
      },
      cardData6: {
        title: '快跑',
        image: require('@/assets/跑步.png'),
        content: '"速度up up up!!!"',
        time: '20-40分钟',
        heart: '110-150次/分',
        freq: '2~3次/周',
        velocity: '8-12km/h'
      },
      cardData7: {
        title: '爬山',
        image: require('@/assets/爬山.png'),
        content: '"山不见我 我自会去见山"',
        time: '2~8小时',
        heart: '100-150次/分',
        freq: '1~2周一次',
        velocity: '3km/h'
      },
      cardData8: {
        title: '散步',
        image: require('@/assets/散步.jpeg'),
        content: '"伴着音乐也许更浪漫"',
        time: '30-60分钟',
        heart: '80-100次/分',
        freq: '4~7次/周',
        velocity: '80米/分'
      }

    }
  }}




</script>

<style scoped>
.totalcard{
  background-color: aliceblue;
}
.card {
  width: 300px; /* 设置每个项目的宽度 */
  height: 350px; /* 设置每个项目的高度 */
  margin: 70px; /* 设置项目之间的间距 */
}
.container {
  display: flex;
  flex:1; /* 如果需要，可以换行 */
  flex-wrap: wrap;
  margin-bottom:100px;

}


</style>