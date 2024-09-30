<script>
import request from "@/utils/request";
export default {
  name: "Setting",
  components: {

  },
  data(){
    return{
      form:{},
      input:""
    }
  },
  created(){
    let str=sessionStorage.getItem("user")||"{}"
    this.form=JSON.parse(str)
  },
  methods:{
    handleClose(){
      this.$router.push('/home');
    },
    update(){
      request.put("api/user",this.form).then(res =>{
        console.log(res);
        if(res.code == '200'){
          this.$message({
            type: "success",
            message:"更新成功"
          })
          sessionStorage.setItem("user",JSON.stringify(this.form))
          this.$router.push('/home');
        }else{
          this.$message({
            type:"error",
            message:"更新失败"
          })
        }
      })
    }
  }
}
</script>

<template>
  <div>

    <el-dialog v-model="form" title="个人信息编辑" width="500" @close="handleClose">
      <el-form :model="form">
<!--        <el-form-item label="ID" :label-width="formLabelWidth" >-->
<!--          <el-input v-model="form.id"></el-input>-->
<!--        </el-form-item>-->
        <el-form-item label="用户名" :label-width="formLabelWidth">
          <el-input v-model="form.username" disabled></el-input>
        </el-form-item>
        <el-form-item label="密码" :label-width="formLabelWidth">
          <el-input v-model="form.password" show-password></el-input>
        </el-form-item>
        <el-form-item label="手机号" :label-width="formLabelWidth">
          <el-input v-model="form.number"></el-input>
        </el-form-item>
        <el-form-item label="邮箱" :label-width="formLabelWidth">
          <el-input v-model="form.email"></el-input>
        </el-form-item>
      </el-form>
      <div class="dialog-footer">
        <el-button @click="this.$router.push('/home')">取消</el-button>
        <el-button type="primary" @click="update">
          确认
        </el-button>
      </div>
    </el-dialog>
  </div>
</template>

<style scoped>

</style>

