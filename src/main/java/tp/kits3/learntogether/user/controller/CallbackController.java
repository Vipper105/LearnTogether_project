package tp.kits3.learntogether.user.controller;

import org.json.JSONObject; // https://mvnrepository.com/artifact/org.json/json
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import javax.crypto.Mac;
import javax.crypto.spec.SecretKeySpec;
import javax.xml.bind.DatatypeConverter;
import java.util.logging.Logger;

@RestController
public class CallbackController {

	private Logger logger = Logger.getLogger(this.getClass().getName());
    private String key2 = "eG4r0GcoNtRGbO8";
    private Mac HmacSHA256;

    public CallbackController() throws Exception  {
        HmacSHA256 = Mac.getInstance("HmacSHA256");
        HmacSHA256.init(new SecretKeySpec(key2.getBytes(), "HmacSHA256"));
    }

    @PostMapping("/callback")
    public String callback(@RequestBody String jsonStr) {
        JSONObject result = new JSONObject();

        try {
          JSONObject cbdata = new JSONObject(jsonStr);
          String dataStr = cbdata.getString("data");
          String reqMac = cbdata.getString("mac");

          byte[] hashBytes = HmacSHA256.doFinal(dataStr.getBytes());
          String mac = DatatypeConverter.printHexBinary(hashBytes).toLowerCase();

          // kiểm tra callback hợp lệ (đến từ ZaloPay server)
          if (!reqMac.equals(mac)) {
              // callback không hợp lệ
              result.put("returncode", -1);
              result.put("returnmessage", "mac not equal");
          } else {
              // thanh toán thành công
              // merchant cập nhật trạng thái cho đơn hàng
              JSONObject data = new JSONObject(dataStr);
              logger.info("update order's status = success where apptransid = " + data.getString("apptransid"));

              result.put("returncode", 1);
              result.put("returnmessage", "success");
          }
        } catch (Exception ex) {
          result.put("returncode", 0); // ZaloPay server sẽ callback lại (tối đa 3 lần)
          result.put("returnmessage", ex.getMessage());
        }

        // thông báo kết quả cho ZaloPay server
        return result.toString();
    }
}
