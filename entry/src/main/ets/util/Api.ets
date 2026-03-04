import http from '@ohos.net.http';

export class Api { // 类名首字母大写（ArkTS规范，避免检查警告）
  // 修复：用readonly替代const，定义类的只读常量
  private readonly HOST: string = "http://115.190.244.152:9999";

  // 修复：去掉function关键字，类方法直接声明，补充this访问HOST
  async POST(url: string, payload: object): Promise<string | null> {
    const httpRequest = http.createHttp();
    try {
      console.log("[日志] url:" + this.HOST + url);
      const response = await httpRequest.request(this.HOST + url, {
        method: http.RequestMethod.POST,
        header: { 'Content-Type': 'application/json; charset=utf-8' },
        extraData: JSON.stringify(payload),
        readTimeout: 10000,
        connectTimeout: 10000
      });
      console.info('状态码:', response.responseCode);
      return response.responseCode === 200 ? response.result.toString() : null;
    } catch (err) {
      console.error('请求失败:', JSON.stringify(err));
      return null;
    } finally {
      httpRequest.destroy();
    }
  }
}