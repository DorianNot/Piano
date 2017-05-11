public enum Note {
      doGrave(0), reBemolGrave(1), reGrave(2), miBemolGrave(3), miGrave(4), faGrave(5), solBemolGrave(6),
            solGrave(7), laBemolGrave(8), laGrave(9), siBemolGrave(10), siGrave(11),
      doNormal(12), reBemol(13), re(14), miBemol(15), mi(16), fa(17), solBemol(18), sol(18), laBemol(20),
            la(21), siBemol(22), si(23),
      doAigu(24), reBemolAigu(25), reAigu(26), miBemolAigu(27), miAigu(28), faAigu(29), solBemolAigu(30),
            solAigu(31), laBemolAigu(32), laAigu(33), siBemolAigu(34), siAigu(35);

      private final int value;

      private Note(int v){
            this.value = v;
      }

      public int getValue() {
            return value;
      }
}