<script>
export default {
  name: "Analysis_A",
  components: {

  },
  data(){
    return{
      body: {},
      BMIMsg: '',
      BMIRes: 0,
      BMIScore: 0,
      pressMsg: '',
      pressScore: 0,
      sugarMsg: '',
      sugarScore: 0,
      lipidMsg: '',
      lipidScore: 0,
      smokingMsg: '',
      smokingScore: 0,
      drinkingMsg: '',
      drinkingScore: 0,
      exerciseMsg: '',
      exerciseScore: 0,
      waterMsg: '',
      waterScore: 0,
      sleepMsg: '',
      sleepScore: 0,
      score: 0,
      visible: false,
      idIndex: 0,
      index: 0,
      total: 0
    }
  },
  created(){
    let bodyStr=sessionStorage.getItem("body")||"{}"
    this.body=JSON.parse(bodyStr)
    this.total = sessionStorage.getItem("total")
    if(this.total > 1){
      this.idIndex = sessionStorage.getItem("idIndex")
      this.index=this.body.findIndex(item => item.id == this.idIndex)
    }
    else{
      this.index=0
    }
    console.log(this.index)
    this.bmi()
    this.threeHeight()
    this.sleep()
    this.habits()
    this.score = ((this.BMIScore+this.pressScore+this.sugarScore+this.lipidScore+this.drinkingScore+this.smokingScore+this.waterScore+this.sleepScore)/8/20).toFixed(2)
  },
  methods:{
    //BMI
    bmi(){
      this.BMIRes = (this.body[this.index].weight/(this.body[this.index].height*this.body[this.index].height)).toFixed(2);
      if( this.BMIRes < 18.5 ){
        switch(this.body[this.index].gender){
          case "女":
            this.BMIMsg = "您已经偏瘦了，平时要注意正常饮食，不要为了美丽抛弃健康哦！"
            break;
          case "男":
            this.BMIMsg = "您已经偏瘦了，平时要注意多锻炼增肌才能健康帅气哦！"
        }
        this.BMIScore = 80
      }
      else if( this.BMIRes >= 18.5 && this.BMIRes < 24.0 ){
        this.BMIMsg = "您现在的体重非常健康，一定要保持下去！"
        this.BMIScore = 100
      }
      else if( this.BMIRes >= 24.0 && this.BMIRes < 28.0 ){
        this.BMIMsg = "现在有点小胖了，是时候开展减肥计划了！"
        this.BMIScore = 80
      }
      else{
        this.BMIMsg = "已经处于肥胖程度，管住嘴迈开腿才能变得健康！"
        this.BMIScore = 60
      }
    },
    //三高
    threeHeight(){
      //血压分析
      if (this.body[this.index].bloodPressureH <= 90 || this.body[this.index].bloodPressureL <= 60) {
        this.pressMsg = "您的血压过低，建议适当摄入富含蛋白质的食物，适当多吃坚果类食物，平时注意锻炼，改善血压。"
        this.pressScore = 80
      } else if ((this.body[this.index].bloodPressureH > 120 || this.body[this.index].bloodPressureL > 80) && (this.body[this.index].bloodPressureH <= 139 && this.body[this.index].bloodPressureL <= 89)) {
        this.pressScore = 80
        this.pressMsg = "您的血压略高，注意适当清淡饮食即可恢复正常值"
      } else if (this.body[this.index].bloodPressureH >= 140 && this.body[this.index].bloodPressureL <= 90 ) {
        this.pressScore = 60
        this.pressMsg = "您可能是单纯收缩期高血压患者，注意戒烟，忌酗酒，定时体检，严重时及时就医"
      } else if (this.body[this.index].bloodPressureH >= 140 && this.body[this.index].bloodPressureL >= 90 ) {
        this.pressScore = 40
        this.pressMsg = "您现在血压过高，可能是高血压患者，注意避免食用高盐食物，减少咖啡、浓茶等刺激性饮品的摄入，定时体检，谨遵医嘱"
      } else {
        this.pressScore = 100
        this.pressMsg = "您的血压处于正常范围，请继续保持现在的生活习惯。"
      }
      //血糖分析
      if (this.body[this.index].bloodSugar < 2.8){
        this.sugarMsg = "您的血糖过低，注意按时吃饭"
        this.sugarScore = 80
      }
      else if (this.body[this.index].bloodSugar > 2.8 && this.body[this.index].bloodSugar <= 6.1){
        this.sugarMsg = "您的空腹血糖处于正常值，一定要保持健康的生活习惯！"
        this.sugarScore = 100
      }
      else if (this.body[this.index].bloodSugar > 6.1 && this.body[this.index].bloodSugar <= 7.0){
        this.sugarMsg = "您的空腹血糖偏高，可能是空腹血糖受损或糖耐量异常，注意少吃甜食，多听医生的建议。"
        this.sugarScore = 80
      }
      else{
        this.sugarScore = 60
        this.sugarMsg = "您的血糖过高，可能是糖尿病患者，注意控制糖分摄入，避免高糖食物和饮料，适量摄入富含纤维的食物帮助稳定血糖，及时就医，谨遵医嘱。";
      }
      //血脂分析
      if (this.body[this.index].bloodLipid <= 3.0){
        this.lipidScore = 60
        this.lipidMsg = "您的血脂过低，适当地进食含有蛋白质、脂肪和胆固醇的物质，长时间低血脂应当及时就医。"
      } else if (this.body[this.index].bloodLipid > 3.0 && this.body[this.index].bloodLipid <= 5.7){
        this.lipidScore = 100
        this.lipidMsg = "您的血脂（TC）处于正常值，请继续保持健康的习惯。"
      } else {
        this.lipidScore = 60
        this.lipidMsg = "您的血脂过高，请注意限制油脂类食物的摄入，多吃水果蔬菜，谨遵医嘱。"
      }
    },
    sleep(){
      if(this.body[this.index].sleepDuration < 7){
        this.sleepScore = 70
        this.sleepMsg = "您的睡眠时间太少了，再忙也不要忘记休息哦！"
      } else if(this.body[this.index].sleepDuration >= 7 && this.body[this.index].sleepDuration <= 10){
        this.sleepMsg = "您的睡眠很好，记得保持规律作息，坚持下去。"
        this.sleepScore = 90
      } else{
        this.sleepMsg = "您的睡眠很充足，也可以选择适当锻炼增强体魄。"
        this.sleepScore = 70
      }
      if(this.body[this.index].sleepQuality == '差'){
        this.sleepScore = this.sleepScore-10
        this.visible = true
      }
    },
    habits(){
      //抽烟习惯
      if (this.body[this.index].smoking === 0) {
        this.smokingMsg = "不抽烟是很好的生活习惯，请继续保持。"
        this.smokingScore = 100
      }
      else{
        this.smokingMsg = "吸烟有害健康，注意时刻关注身体情况。"
        this.smokingScore = 60
        if (this.body[this.index].bloodPressureH >= 140 && this.body[this.index].bloodPressureL >= 90 ) {
          this.smokingMsg = "您的血压过高，建议尽早戒烟。"
          this.smokingScore = 40
        }
      }
      //饮酒习惯
      if (this.body[this.index].drinking === 0) {
        this.drinkingScore = 100
        this.drinkingMsg = "不喝酒是很好的生活习惯，请继续保持。"
      }
      else{
        this.drinkingMsg = "小酌怡情，酗酒伤身，注意适量饮酒。"
        this.drinkingScore = 70
        if (this.body[this.index].bloodPressureH >= 140 && this.body[this.index].bloodPressureL >= 90 ) {
          this.drinkingMsg = "您的血压过高，建议减少饮酒。"
          this.drinkingScore = 40
        }
      }
      //喝水习惯
      if (this.body[this.index].weight * 30 >= this.body[this.index].waterConsumption){
        this.waterMsg = "您的饮水量过低，建议多喝水。"
        this.waterScore = 60
      } else{
        this.waterMsg = "您的饮水量充足，请继续保持。"
        this.waterScore = 100
      }
      //运动习惯
      if (this.body[this.index].exercise === 0){
        this.exerciseMsg = "锻炼才能有更好的体魄，要加强锻炼哦！"
        this.exerciseScore = 60
      } else{
        this.exerciseMsg = "生命来源于运动，请继续保持现在的好习惯！"
        this.exerciseScore = 100
      }
    }
  }
}
</script>

<template>
  <div style="padding-left: 10px; padding-top: 10px" >
    <el-timeline style="max-width: 600px">
      <el-timeline-item timestamp="" placement="top">
        <el-card style="width: 1300px" shadow="hover" class="parent">
          <h4 style="color: steelblue; font-size: larger">BMI分析</h4>
          <p>您的BMI值为<span style="color: cornflowerblue; font-size: larger">{{this.BMIRes}}</span>，{{this.BMIMsg}}</p>
          <el-progress type="circle" :percentage="this.BMIScore.toFixed(2)" class="child"/>
        </el-card>
      </el-timeline-item >
      <el-timeline-item timestamp="" placement="top">
        <el-card style="width: 1300px" shadow="hover" class="parent">
          <h4 style="color: steelblue; font-size: larger">三高警告</h4>
          <p>您的空腹血糖为<span style="color: cornflowerblue; font-size: larger">{{this.body[this.index].bloodSugar}}mmol/L</span>，{{this.sugarMsg}}</p>
          <p>您的血压高压为为<span style="color: cornflowerblue; font-size: larger">{{this.body[this.index].bloodPressureH}}mmHg</span>，血压低压为<span style="color: cornflowerblue; font-size: larger">{{this.body[this.index].bloodPressureL}}mmHg</span>，{{this.pressMsg}}</p>
          <p>您的血脂为<span style="color: cornflowerblue; font-size: larger">{{this.body[this.index].bloodLipid}}mmol/L</span>，{{this.lipidMsg}}</p>
          <el-progress type="circle" :percentage="((this.pressScore+this.sugarScore+this.lipidScore)/3).toFixed(2)"  class="child"/>
        </el-card>
      </el-timeline-item>
      <el-timeline-item timestamp="" placement="top">
        <el-card style="width: 1300px" shadow="hover" class="parent">
          <h4 style="color: steelblue; font-size: larger">生活习惯</h4>
          <p>{{this.smokingMsg}}</p>
          <p>{{this.drinkingMsg}}</p>
          <p>建议的饮水量为<span style="color: cornflowerblue; font-size: larger">{{(this.body[this.index].weight * 30).toFixed(0)}}毫升每天</span>，{{this.waterMsg}}</p>
          <el-progress type="circle" :percentage="((this.smokingScore+this.drinkingScore+this.waterScore)/3).toFixed(2)" class="child"/>
        </el-card>
      </el-timeline-item>
      <el-timeline-item timestamp="" placement="top">
        <el-card style="width: 1300px" shadow="hover" class="parent">
          <h4 style="color: steelblue; font-size: larger">睡眠状态</h4>
          <p>您的睡眠时间为<span style="color: cornflowerblue; font-size: larger">{{this.body[this.index].sleepDuration}}小时</span>，{{this.sleepMsg}}</p>
          <el-link v-if="visible"
                   :underline="false"
                   style="font-size: small"
                   href="https://www.mayoclinic.org/zh-hans/healthy-lifestyle/adult-health/in-depth/sleep/art-20048379">
            您晚上睡不好，可以点击这段文字查看睡眠小妙招哦！
          </el-link>
          <el-progress type="circle" :percentage="this.sleepScore.toFixed(2)" class="child"/>
        </el-card>
      </el-timeline-item>
    </el-timeline>
    <span class="demonstration" style="padding-left: 80px; color: #165461">总分</span>
    <el-rate style="padding-left: 20px" v-model="this.score" disabled show-score text-color="#ff9900" score-template="{value}points"/>
  </div>
</template>

<style scoped>
.parent {
  position: relative;
  width: 200px;
  height: 200px;
}

.child {
  position: absolute;
  top: 35px;
  right: 30px;
}
</style>