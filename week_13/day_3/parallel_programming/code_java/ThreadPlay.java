class ThreadPlay{
  public static void main(String[] args){
    double sum = 0;
    double[] values = new double[1000000];
    //setup array
    for(int i=0;i<values.length; i++){
      values[i] = i;
    }
    //sum with expensive operation
    long startTime = System.currentTimeMillis();
    for (double number : values) {
      sum += expensiveOperation(number);
    }
    long endTime = System.currentTimeMillis();
    long duration = (endTime - startTime);

    System.out.println("The sum is " + sum);
    System.out.println("summing took " + duration/1000.0 + " seconds" );
  }

  private static double expensiveOperation(double num){
    for(int i=0; i < 500 ; i++ ) {
      num = Math.sqrt( num ) + 5;
    }
    return num;
  }
}
