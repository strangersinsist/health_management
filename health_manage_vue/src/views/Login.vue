<script>
import request from "@/utils/request";

export default {
  name: "Login",
  components: {User,Lock},
  data(){
    return {
      form:{},
      rules:{
        username:[
          {required:true,message:"请输入用户名",trigger:'blur'},
        ],
        password:[
          {required:true,message:"请输入密码",trigger:'blur'},
        ],
      }
    }
  },
  methods:{
    login(){
      request.post("/api/user/login",this.form).then(res =>{
        console.log(res);
        if(res.code == '200'){
          this.$message({
            type: "success",
            message:"登录成功"
          })
          //改一下试图存缓存
          sessionStorage.setItem("user", JSON.stringify(res.data));

          this.$router.push("/")
        }else{
          this.$message({
            type:"error",
            message:"用户名或密码错误"
          })
        }
      })
    }
  }
}
import {
  User,Lock,
} from '@element-plus/icons-vue'

</script>

<template>
  <div class="login-container">
    <div class="login-card">
      <h1 class="login-title">欢迎登录</h1>
      <el-form :model="form" :rules="rules" class="login-form" ref="loginForm" size="large">
        <el-form-item prop="username" class="form-item">
          <el-icon class="icon"><User /></el-icon>
          <el-input v-model="form.username" placeholder="用户名：" class="input-field"></el-input>
        </el-form-item>
        <el-form-item prop="password" class="form-item">
          <el-icon class="icon"><Lock /></el-icon>
          <el-input type="password" v-model="form.password" placeholder="密码：" class="input-field" show-password></el-input>
        </el-form-item>
        <div class="form-actions">
          <el-button class="action-button" @click="login">登录</el-button>
          <el-button class="action-button" @click="this.$router.push('/register')">注册</el-button>
        </div>
      </el-form>
    </div>
  </div>
</template>

<style scoped>
.login-container {
  display: flex;
  align-items: center;
  justify-content: center;
  height: 100vh;
  background: #f2f2f2;
  background-image: url('https://ts1.cn.mm.bing.net/th/id/R-C.b174bee1c5b5588be70d23ba59733cb2?rik=Z7YfL1%2fPHBwhqw&riu=http%3a%2f%2fimg95.699pic.com%2fphoto%2f40005%2f9944.jpg_wh860.jpg&ehk=sAq8XNJwvetcOkjKDMOG4%2f6gVS4tD5qyPYSM4w3Ks7o%3d&risl=&pid=ImgRaw&r=0');
}

.login-card {
  background: rgba(255, 255, 255, 0.9);
  backdrop-filter: blur(10px);
  padding: 40px 60px;
  border-radius: 8px;
  box-shadow: 0 4px 24px rgba(0, 0, 0, 0.1);
  border: 1px solid rgba(0, 0, 0, 0.1);
  width: 100%;
  max-width: 500px;
}

.login-title {
  margin-bottom: 40px;
  color: #555;
  text-align: center;
  font-weight: bold;
  text-transform: uppercase;
  letter-spacing: 1px;
  position: relative;
}

.login-title::after {
  content: '';
  width: 100px;
  height: 3px;
  background: #bbb;
  display: block;
  margin: 8px auto 0;
}

.login-form {
  width: 100%;
}

.form-item {
  margin-bottom: 20px;
  position: relative;
}

.input-field {
  width: 100%;
  border: 1px solid #ccc;
  transition: border-color 0.3s;
}

.input-field:focus {
  border-color: #aaa;
}

.form-actions {
  margin-top: 30px;
  display: flex;
  justify-content: space-between;
}

.action-button {
  width: 48%;
  background: #ddd;
  border-color: #ddd;
  color: #555;
  box-shadow: none;
  transition: background-color 0.3s, color 0.3s;
}

.action-button:hover {
  background: #ccc;
  border-color: #ccc;
  color: #333;
}
</style>