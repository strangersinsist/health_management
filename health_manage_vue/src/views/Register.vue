<script>
import request from "@/utils/request";
import {
  User, Lock,
} from '@element-plus/icons-vue'

export default {
  name: "Login",
  components: { User, Lock },
  data() {
    return {
      form: {},
      rules: {
        username: [
          {required: true, message: "请输入用户名", trigger: 'blur'},
        ],
        password: [
          {required: true, message: "请输入密码", trigger: 'blur'},
        ],
        confirm: [
          {required: true, message: "请确认密码", trigger: 'blur'},
        ],
      }
    }
  },
  methods: {
    register() {
      this.$refs['myForm'].validate((valid) => {
        if (!valid) {
          return false;
        }

        if (this.form.password != this.form.confirm) {
          this.$message({
            type: "error",
            message: "两次输入密码不一致"
          })
          return
        }

        request.post("/api/user/register", this.form).then(res => {
          console.log(res);
          if (res.code == '200') {
            this.$message({
              type: "success",
              message: "注册成功"
            })
            this.$router.push("/login")
          } else {
            this.$message({
              type: "error",
              message: "注册失败,请更换用户名重试"
            })
          }
        })
      });
    }
  }
}
</script>

<template>
  <div class="register-container">
    <div class="register-card">
      <h1 class="register-title">欢迎注册</h1>
      <el-form ref="myForm" :model="form" :rules="rules" class="register-form" size="large">
        <el-form-item prop="username">
          <el-icon>
            <User/>
          </el-icon>
          <el-input v-model="form.username" placeholder="用户名："></el-input>
        </el-form-item>
        <el-form-item prop="password">
          <el-icon>
            <Lock/>
          </el-icon>
          <el-input v-model="form.password" show-password placeholder="密码："/>
        </el-form-item>
        <el-form-item prop="confirm">
          <el-icon>
            <Lock/>
          </el-icon>
          <el-input v-model="form.confirm" show-password placeholder="确认密码："/>
        </el-form-item>
        <el-form-item>
          <el-button class="action-button" @click="register">注册</el-button>
        </el-form-item>
      </el-form>
    </div>
  </div>
</template>

<style scoped>
.register-container {
  display: flex;
  align-items: center;
  justify-content: center;
  height: 100vh;
  background: #f2f2f2;
  background-image: url('https://ts1.cn.mm.bing.net/th/id/R-C.b174bee1c5b5588be70d23ba59733cb2?rik=Z7YfL1%2fPHBwhqw&riu=http%3a%2f%2fimg95.699pic.com%2fphoto%2f40005%2f9944.jpg_wh860.jpg&ehk=sAq8XNJwvetcOkjKDMOG4%2f6gVS4tD5qyPYSM4w3Ks7o%3d&risl=&pid=ImgRaw&r=0');
  //background-size: cover;
  //background-position: center;
}

.register-card {
  background: rgba(255, 255, 255, 0.9);
  backdrop-filter: blur(10px);
  padding: 40px 60px;
  border-radius: 8px;
  width: 100%;
  max-width: 500px;
  box-shadow: 0 4px 24px rgba(0, 0, 0, 0.1);
  border: 1px solid rgba(0, 0, 0, 0.1);
}

.register-title {
  margin-bottom: 40px;
  color: #555;
  text-align: center;
  font-weight: bold;
  text-transform: uppercase;
  letter-spacing: 1px;
  position: relative;
}


.register-title::after {
  content: '';
  width: 100px;
  height: 3px;
  background: #bbb;
  display: block;
  margin: 8px auto 0;
}

.register-form {
  width: 100%;

}

.action-button {
  width: 100%;
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