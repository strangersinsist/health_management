<script>
export default {
  name: "Shopping",
  components:{

  },
  metaInfo: {
    meta: [
      {
        name: "viewport",
        content: "width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no"
      }
      // 更多的meta标签
    ]
  },
  data(){

  },

  methods: {

  }
}
</script>

<template>
  <div class="flex-layout">
    <h1 style="font-size: 33px;font-family: STHeiti,sans-serif;font-weight: bolder;color:deepskyblue;margin-left: 10px">【欢迎来到运动商城】</h1>
    <br>
    <p style="font-size: 25px;font-family: 'Droid Serif',sans-serif;font-weight: bold;margin-left: 30px">可跳转对应链接</p>
    <br>
    <div class="image-container">
          <img src="@/assets/跳绳.png" style="margin-left:30px">
          <img src="@/assets/踏步机.png">
          <img src="@/assets/运动套装（女）.png">
          <img src="@/assets/运动套装（男）.png">
          <img src="@/assets/运动耳机.png"style="margin-right: 250px" >
        </div>

        <div class="tag-container">
        <el-link class="custom1":underline="false" href="https://detail.tmall.com/item.htm?ali_refid=a3_430673_1006:1267930137:N:8uhpig6VQHR/8eFHm0bJ1w==:188cfe3d2941973c74e68ab30a1ffefc&ali_trackid=1_188cfe3d2941973c74e68ab30a1ffefc&bxsign=tanRwseYz62mHUyYPhhMtrt49DY5mkgNAWEDfuRtPGos9jBorEL8rRKWIart-ChktNMPh5fQ_hPUR1SydztTbq4IBHdrVELDlkGYqs5JzEVijM&id=644627394658&spm=a2e0b.20350158.31919782.2">跳绳</el-link>
        <el-link class="custom2":underline="false" href="https://detail.tmall.com/item.htm?ali_refid=a3_430673_1006:1243610061:N:+tGSgPfVipLXUb+A5XtBwdqrCTztF2ED:9c2c8cb6552de93b4ea466b1bed6602c&ali_trackid=199_9c2c8cb6552de93b4ea466b1bed6602c&bxsign=tanqes5ZE1eTT-LgEoj57r8Z7mo82SHjZpoN5WcIMjI6wGeDEm3vRXf9XquL5NLr5QSVxRdVA4WMBqy3jKm2srE3oStmkki_LZudTzo7oiu5QM&id=733712517377&spm=a2e0b.20350158.31919782.2">踏步机</el-link>
        <el-link class="custom3":underline="false" href="https://detail.tmall.com/item.htm?ali_refid=a3_430673_1006:1123228162:H:kmRhYob8+9k5NXJbXNJ4k1iPmZ/te0eJ:96062771551b5155ae52d4d0a3120f59&ali_trackid=282_96062771551b5155ae52d4d0a3120f59&bxsign=tanoWhb94Au0zXAEHEVhnwcakTbzm5ZZW-Z9zE1oSBuumsU0C58QXiQDp3pehbETaz4g2UgcKpIQ2OOddtSk8xOIO05uShjJBTbwwEyHMlrgCE&id=666055276707&spm=a2e0b.20350158.31919782.1">运动套装（女）</el-link>
        <el-link class="custom4":underline="false" href="https://detail.tmall.com/item.htm?ali_refid=a3_430673_1006:1151357728:H:xUnXGie2dMDtLQA14OytFuSqO/G/gznD:cdfab68cf26f981dcdac498b8c2e6151&ali_trackid=282_cdfab68cf26f981dcdac498b8c2e6151&bxsign=tanUJRkpANeeGYPdVlgM2tQBEfOtjgm6xfJdga8122xHjX4MOHhqDBrxfQJdtx8qF0lQJsGAuF0p2wVQI-WFK2k_W2GKkaqY1PIGfLYVRGR3Z0&id=559060544796&spm=a2e0b.20350158.31919782.1">运动套装（男）</el-link>
        <el-link class="custom5" :underline="false" href="https://detail.tmall.com/item.htm?ali_refid=a3_430673_1006:1349480063:H:18A5FPwihnJfIV+F7UQIbg==:02efc5a5585a3925a021450fbed67f72&ali_trackid=282_02efc5a5585a3925a021450fbed67f72&bxsign=tanm3sf5Hqsq_hKJBRXtZV7O_TduJbOsAD-07JJG0u5Q8mS0KeTthZ1Q7ukLNlFbhS0T4w5NQOqDy_siZkaR2OkCkjXoDxAXgnKAQ9nZOWDtyE&id=777208555474&spm=a2e0b.20350158.31919782.3" >运动耳机</el-link>
        </div>

      <div class="image-containernew">
        <img src="@/assets/image/image1.jpg"style="margin-left:30px">
        <img src="@/assets/image/image2.jpg">
        <img src="@/assets/image/image3.jpg">
        <img src="@/assets/image/image4.jpg">
        <img src="@/assets/image/image5.jpg">
      </div>

      <div class="tag-containernew">
      <el-link class="custom6":underline="false" href="https://detail.tmall.com/item.htm?ali_refid=a3_430673_1006:1152459543:N:F6f+ZQwoACHSE9tgoyO3bw==:ad84de3a4cd856b3122776e5ae8ee90c&ali_trackid=1_ad84de3a4cd856b3122776e5ae8ee90c&bxsign=tan-0-VMSM_8qhY7L631s87P0f_OE0ywgqZ9EEF8WkXcTONOmNla1V7XJmblbNEkdpBdhVUW-p6hJ0WNd7ma69bUD_fIm47s4MdBUrU7OPZ5Ns&id=591666159469&spm=a2e0b.20350158.31919782.1&sku_properties=3344920:4134720">哑铃</el-link>
      <el-link class="custom7":underline="false" href="https://detail.tmall.com/item.htm?ali_refid=a3_430673_1006:1103172878:H:66jp/U7hR56LJyDhTnH6nZeqlIg9UUx3:482cdefc836a10ef53e8cf70c3856639&ali_trackid=282_482cdefc836a10ef53e8cf70c3856639&bxsign=tangTVQXGTIcpyYPqRzVFQ58ZhPvgzM-r2hgbucwzqvcb-bl35FZB90lk2xwowpStBrKS7xwCuXoOiLfhB8jFbLO40rK_cmcTKtd_JSpBfDJ0E&id=778110241837&spm=a2e0b.20350158.31919782.8">拉力器弹力绳</el-link>
      <el-link class="custom8":underline="false" href="https://detail.tmall.com/item.htm?ali_refid=a3_430673_1006:1103792501:N:9K4VpGVwi4Yp+FOjdE3Lag==:c5c5ec264e0c132d4f0a656274192723&ali_trackid=1_c5c5ec264e0c132d4f0a656274192723&bxsign=tana0HCPqGyWszEl1ChR0fATZLYKlnRA_8BPWS87K3xUJSbFxNWNk7d38XPapKwB8iGvTsMo2ag9v0pb1SUWPtkMofLwZcvFApctaQY-1P5uDk&id=734862330602&spm=a2e0b.20350158.31919782.2">筋膜枪</el-link>
      <el-link class="custom9":underline="false" href="https://detail.tmall.com/item.htm?ali_refid=a3_430673_1006:1102601846:N:9d8xSPrTKbi6mOyR2GzLog==:d0346ef56666b3560d5da2bb556a2959&ali_trackid=162_d0346ef56666b3560d5da2bb556a2959&bxsign=tan5aI6oLi_H3eEkFg3-w24zrxqk4XzwEVuexa9sHGB2ovovCsQYPRa_Wf478W1Zn5SSXUJ717D1v7-2b2lWcl2Y_nFck0H8cF5pML9r_wTlJQ&id=635837666041&spm=a2e0b.20350158.31919782.9">运动鞋（女）</el-link>
      <el-link class="custom10":underline="false" href="https://detail.tmall.com/item.htm?ali_refid=a3_430673_1006:1102227079:N:Q6nvdxDN0q4pMtaAO1pl7A==:61f1edbf777bba699b43d6cb8ae2be08&ali_trackid=162_61f1edbf777bba699b43d6cb8ae2be08&bxsign=tancBYigtnyZfI4Vwgm0x4X1sTSdL8ZL8JSXBCqhUeDOa3xcuewkJ6iCqzeWdnE8BL965fANyke95Yq-PJ4Km1b5lh-sCVYjV0U3GKKc3pOWn4&id=750132892895&spm=a2e0b.20350158.31919782.1">运动鞋（男）</el-link>
      </div>
      </div>
</template>


<style scoped>
.flex-layout{
  background-color: aliceblue;

}

.image-container {
  display: flex;
  flex: 1;
}
.image-container img {
  width: 280px;
  height: 280px;
  margin-right: 75px;
}
image-containernew{
  display: flex;
  flex: 1;
}
.image-containernew img {
  width: 280px;
  height: 280px;
  margin-right: 75px;
}

.custom1.el-link {
  font-size:20px;
  font-weight: bold;
  margin-left:155px;
  margin-right:145px;
  margin-bottom: 20px;
}
.custom2.el-link {
  font-size:20px;
  font-weight: bold;
  margin-left:145px;
  margin-right:145px;
  margin-bottom: 20px;
}
.custom3.el-link {
  font-size:20px;
  font-weight: bold;
  margin-left:130px;
  margin-right:120px;
  margin-bottom: 20px;
}
.custom4.el-link {
  font-size:20px;
  font-weight: bold;
  margin-left:100px;
  margin-right:120px;
  margin-bottom: 20px;
}
.custom5.el-link {
  font-size:20px;
  font-weight: bold;
  margin-left:110px;
  margin-right:145px;
  margin-bottom: 20px;
}
.custom6.el-link {
  font-size:20px;
  font-weight: bold;
  margin-left:155px;
  margin-right:145px;
  margin-bottom: 20px;
}
.custom7.el-link {
  font-size:20px;
  font-weight: bold;
  margin-left:125px;
  margin-right:145px;
  margin-bottom: 20px;
}
.custom8.el-link {
  font-size:20px;
  font-weight: bold;
  margin-left:125px;
  margin-right:145px;
  margin-bottom: 20px;
}
.custom9.el-link {
  font-size:20px;
  font-weight: bold;
  margin-left:125px;
  margin-right:145px;
  margin-bottom: 20px;
}
.custom10.el-link {
  font-size:20px;
  font-weight: bold;
  margin-left:90px;
  margin-right:145px;
  margin-bottom: 20px;
}

</style>