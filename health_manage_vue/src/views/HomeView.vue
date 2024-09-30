<template>
  <div style="flex:1">
    <el-carousel style="height: 50vh; width: 100vh;margin-left: 20vh">
      <el-carousel-item v-for="item in imgwrap" :key="item.url " style="height: 50vh; width: 100vh;">
        <img :src="item.url" style="height: 50vh; width: 100vh;" alt="图片加载失败"/>
      </el-carousel-item>
    </el-carousel>
    <el-card style="width:1400px;text-align: center;margin:10px;font-size: 25px;background-color: antiquewhite;color: darkslategray">食物热量表</el-card>
    <div style="display:flex">
    <el-card style="max-width: 480px;margin:10px;">
      <template #header>
        <div class="card-header">
          <span style="font-size: larger">主食类</span>
        </div>
      </template>
      <p>米饭（1/4碗）—————————————— 80cal</p>
      <p>米粥（半碗） —————————————— 80cal</p>
      <p>玉米（100g）—————————————— 106cal</p>
      <p>面条（半碗） —————————————— 80cal</p>
    </el-card>
      <el-card style="max-width: 480px;margin:10px;">
        <template #header>
          <div class="card-header">
            <span style="font-size: larger">肉类</span>
          </div>
        </template>
        <p>瘦肉（37g）————————————————80cal</p>
        <p>肥肉（20g）————————————————80cal</p>
        <p>奶类（125g）———————————————106cal</p>
        <p>鸡蛋（1个）————————————————75cal</p>
      </el-card>
      <el-card style="max-width: 480px;margin:10px;">
        <template #header>
          <div class="card-header">
            <span style="font-size: larger">水果类</span>
          </div>
        </template>
        <p>苹果（100g）————————————————52cal</p>
        <p>香蕉（100g）————————————————92cal</p>
        <p>榴莲（100g）———————————————147cal</p>
        <p>荔枝（半碗）————————————————100cal</p>
      </el-card>
    </div>
  </div>
  <div class="container">
    <div class="chatbox">
      <h2 class="title">健康问答</h2>
      <div class="messages" ref="messageBox">
        <div
            v-for="(message, index) in messages"
            :key="index"
            :class="{'message-container': true, 'user-message': message.sender === 'User', 'bot-message': message.sender !== 'User'}"
        >
          <el-avatar class="message-avatar" style="background-color: cornflowerblue;color: black">{{message.sender === 'User' ? 'User' : 'Bot'}}</el-avatar>
          <div class="message-content">{{message.text}}</div>
        </div>
      </div>

      <div class="input-section">
        <input
            type="text"
            class="userinput"
            v-model="userInput"
            @keyup.enter="sendMessage"
            placeholder="输入："
        />

        <button
            class="send"
            @click="sendMessage"
        >
          发送
        </button>
      </div>
    </div>
  </div>

</template>

<script>
import axios from 'axios'
export default {
  name: 'HomeView',
  components: {

  },
  data(){
    return{
      userInput: '',
      messages: [],
      imgwrap:[
        {url:require("../assets/washing_tooth.jpeg")},
        {url:require("../assets/aids.webp")},
        {url:require("../assets/food.webp")},
        {url:require("../assets/sport.jpeg")},
        {url:require("../assets/washing_hand.jpeg")}
      ]
    }
  },
  methods:{
    async callAPIMethod(input) {
      try {
        const response = await axios.post('http://localhost:9091/reply', { message: input });
        return response.data;
      } catch (error) {
        console.error(error);
      }
    },

    async sendMessage() {
      this.messages.push({
        sender: 'User',
        text: this.userInput,
      });
      console.log("Ready to send message: " + this.userInput);
      const response = await this.callAPIMethod(this.userInput);
      console.log("Received message: " + response);
      if(response) {
        this.messages.push({
          sender: 'Bot',
          text: response,
        });
      }

      // Scroll to the bottom of messages
      this.$refs.messageBox.scrollTop = this.$refs.messageBox.scrollHeight;

      this.userInput = '';
    },
  },
}


</script>

<style scoped>
.title {
  text-align: center;
  padding: 10px;
  color: #333;
  border-bottom: 1px solid #ddd;
}

.container {
  display: flex;
  justify-content: center;
  height: 100vh;
  align-items: center;
  padding: 20px;
  background-color: #f2f2f2;
}

.chatbox {
  width: 400px;
  background-color: #ffffff;
  border-radius: 10px;
  overflow: hidden;
  box-shadow: 0px 0px 10px 0px rgba(0,0,0,0.2);
}

.messages {
  height: 600px;
  overflow-y: auto;
  padding: 20px;
  border-bottom: 1px solid #ddd;
}

.message-container {
  display: flex;
  align-items: center;
  justify-content: flex-start;
  width: 100%;
  margin-bottom: 20px;
}

.user-message {
  align-self: flex-end;
  flex-direction: row-reverse;
}

.bot-message {
  align-self: flex-start;
}

.message-avatar {
  width: 40px;
  height: 40px;
  margin-right: 15px;
  line-height: 40px;
  text-align: center;
}

.message-content {
  max-width: 70%;
  padding: 10px;
  border-radius: 20px;
  background: #f0f2f5;
}

.user-message .message-content {
  background: #0b93f6;
  color: #fff;
}

.input-section {
  display: flex;
  justify-content: space-between;
  padding: 10px 20px;
  background-color: #ddd;
}

.userinput {
  flex: 1;
  margin-right: 10px;
  padding: 5px 10px;
}

.send {
  padding: 5px 10px;
}

</style>