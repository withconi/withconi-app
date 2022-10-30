class Regex {
  Regex._();
  static final email = RegExp(
      r"^([\w\.\_\-])*[a-zA-Z0-9]+([\w\.\_\-])*([a-zA-Z0-9])+([\w\.\_\-])+@([a-zA-Z0-9]+\.)+[a-zA-Z0-9]{2,8}$");
  static final password =
      RegExp(r"^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d@$.!%*#?&]{8,}$");
  static final name = RegExp(r"^[ㄱ-ㅎ|가-힣|a-z|A-Z]{1,10}$");
  static final nickName = RegExp(r"^[ㄱ-ㅎ|가-힣|a-z|A-Z|0-9]{1,10}$");
}
