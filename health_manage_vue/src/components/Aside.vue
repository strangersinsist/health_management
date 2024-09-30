<script>
import request from "@/utils/request";

export default {
  name: "Aside",
  components: {List, Help, ShoppingBag, Shop, Opportunity, User, House, Setting, Document, Location},
  data(){
    return{
      user:{},
      // path:this.$router.path
    }
  },
  created() {
    let userStr=sessionStorage.getItem("user")||"{}"
    this.user=JSON.parse(userStr)

    //请求服务器，确认当前登录用户的合法信息
    // 算了报错了
    // request.get("/user/"+this.user.id).then(res =>{
    //   if(res.code== '200'){
    //     this.user=res.data
    //   }
    // })


  },
  methods:{
    handleOpen(){
    },
    handleClose(){

    }
  }
}
import {
  Document,
  Location,
  Setting, House, User, Opportunity, Shop, ShoppingBag, Help, List,
} from '@element-plus/icons-vue'
</script>



<template>
  <el-row class="tac">
    <el-col :span="12">
      <el-menu
          default-active="2"
          class="el-menu-vertical-demo"
          @open="handleOpen"
          @close="handleClose"
          style="width:200px;height: calc(100vh - 80px)"
      >
        <el-menu-item index="1" @click="this.$router.push('/login')">
          <el-icon><User /></el-icon>
          <span >登录</span>
        </el-menu-item>
        <el-menu-item index="2" @click="this.$router.push('/home')">
          <el-icon><House /></el-icon>
          <span >主页</span>
        </el-menu-item>
        <el-menu-item index="3" @click="this.$router.push('/acknowledge')">
          <el-icon><opportunity /></el-icon>
          <span >运动知识</span>
        </el-menu-item>
        <el-menu-item index="4" @click="this.$router.push('/shopping')">
          <el-icon><shopping-bag /></el-icon>
          <span >健康购物</span>
        </el-menu-item>
        <el-menu-item index="5" @click="this.$router.push('/e_and_a')">
          <el-icon><help /></el-icon>
          <span >评估与建议</span>
        </el-menu-item>
        <el-menu-item index="6" @click="this.$router.push('/information_update')">
          <el-icon><document /></el-icon>
          <span>健康信息上传</span>
        </el-menu-item>
<!--        <el-menu-item index="7" @click="this.$router.push('/user_manage')">-->
<!--        新增管理员和普通用户权限问题-->
        <el-menu-item index="7" v-if="user.role===1" @click="this.$router.push('/user_manage')">
          <el-icon><List /></el-icon>
          <span>用户管理</span>
        </el-menu-item>
      </el-menu>
    </el-col>
  </el-row>
</template>

<style scoped>

</style>