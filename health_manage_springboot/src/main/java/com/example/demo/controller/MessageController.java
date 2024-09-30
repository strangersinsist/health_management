package com.example.demo.controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;
import java.util.Random;


class Message {
    private String message;

    // getter
    public String getMessage() {
        return this.message;
    }

    // setter
    public void setMessage(String message) {
        this.message = message;
    }

}
@CrossOrigin(origins = "http://localhost:8080")
@RestController
public class MessageController {

    @PostMapping("/reply")
    public String reply(@RequestBody Message message) {
        Random rand = new Random();
        String[] responses = {"保持健康~", "锻炼身体！", "饮食规律~"};
        if ("你好".equals(message.getMessage())) {
            return "你好";
        }
        else if ("什么是亚健康管理系统".equals(message.getMessage())) {
            return "这个亚健康管理系统是人工智能学院java小组开发的。包括主页，运动知识，健康购物，评估与建议，健康信息上传的功能";
        }
        else if("关注亚健康状态，我们需要注意哪些方面？".equals(message.getMessage()))
        {
            return"要注意1.合理饮食 2.适量运动 3.充足睡眠 4.心理健康 5.定期体检 6.健康的生活方式";
        }
        else if("什么是均衡饮食？".equals(message.getMessage()))
        {
            return"您需要吃不同类型且适量的食物以保证营养的全面摄取，谷物类、蔬菜类、水果类、蛋白质类等食物合理搭配，平时要注意控制脂肪、糖分和盐的摄入，保持水分充足，定时定量进餐。";
        }
        else if("每天应该进行多少运动？".equals(message.getMessage()))
        {
            return"根据世界卫生组织的建议，成年人每周应进行至少150分钟中等强度有氧运动，或75分钟高强度有氧运动，或二者的组合。除此之外，还建议进行肌肉锻炼活动，每周至少两次。这些锻炼可以包括举重、俯卧撑、仰卧起坐、哑铃训练等。";
        }
        else if("如何提高睡眠质量？".equals(message.getMessage()))
        {
            return"要保持规律的作息时间，创造良好的睡眠环境，选择合适的寝具，限制引用咖啡因和酒精，注意饮食，限制屏幕时间，放松身心，规律运动，控制小睡时间，管理压力和焦虑，避免长时间卧床";
        }
        else if("如何缓解工作压力？".equals(message.getMessage()))
        {
            return"注意时间管理，设定现实目标，注意休息和放松，保持健康的生活方式，向亲朋好友寻求支持，学习放松技巧，建立界限，自我激励，调整心态，参加培训和学习，创造良好的工作环境，寻求专业帮助";
        }
        else if("心肺复苏（CPR）的步骤是什么？".equals(message.getMessage()))
        {
            return"1.确认现场安全 2.判断意识状态 3.呼吸检查 4.召唤急救人员 5.进行胸外按压 6.进行人工呼吸 7.持续循环 8.使用AED";
        }
        else if("如何正确使用急救包？".equals(message.getMessage()))
        {
            return"1.了解急救包的内容 2.放置在易于取用的地方 3.紧急情况下的使用 4.评估和处理伤者 5.使用急救包内的物品：注意止血和消毒用品，绷带和敷料，医用手套 6.按照急救步骤行动 7.保持沟通和记录 8.不要过度使用";
        }
        else if("如何预防流感？".equals(message.getMessage()))
        {
            return"1.接种疫苗 2.保持良好的卫生习惯：勤洗手，避免触摸面部 3.加强免疫系统 4.避免接触病人 5.保持环境清洁 6.咳嗽和打喷嚏时使用纸巾 7.佩戴口罩 8.及时就医";
        }
        else {
            // randomly select and return a response from the array
            return responses[rand.nextInt(responses.length)];
        }
    }
}
