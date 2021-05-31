double av_level_min = 0, av_level_max = 0; //av = activity
//global variables



class Selector {
  String gender = '', activity_level='',goal ='';
  //goal = lose or gain weight

  double weight = 0 , unc_bmr = 0, bmr_min = 0, bmr_max = 0 ;
//unc = uncomplete

  double D_selector = 0;  //diet selector dpened on it we will choose the diet we track for the user

  String Plan = 'Z';  //the caller of the plan from database and 'Z' value for the plans bigger than 5500 and smaller than 1000


  //The constructor
  //The constructorr
  Selector(String gender , String activity_level, String goal, double weight){
    this.gender = gender;
    this.activity_level = activity_level;
    this.goal = goal;
    this.weight = weight;
  }



  //all calculations
  //all calculations
  void calculate() {
    //activity level selection
    if (gender == "Male") {
      //for male
      switch (activity_level) {
        case 'Low activity (setting on pc)' :
          {
            av_level_min = 0.25;
            av_level_max = 0.4;
          }
          break;
        case 'Regular activity(doing daily works )' :
          {
            av_level_min = 0.5;
            av_level_max = 0.7;
          }
          break;
        case 'High activity (walking daily/byclying)' :
          {
            av_level_min = 0.65;
            av_level_max = 0.8;
          }
          break;
        case 'Extermly high activity(going to gym )' :
          {
            av_level_min = 0.9;
            av_level_max = 1.2;
          }
          break;
      } //end of switch
    }

    if (gender == 'Female') {
      //for women
      switch (activity_level) {
        case 'Low activity (setting on pc)' :
          {
            av_level_min = 0.25;
            av_level_max = 0.35;
          }
          break;
        case 'Regular activity(doing daily works )' :
          {
            av_level_min = 0.4;
            av_level_max = 0.6;
          }
          break;
        case 'High activity (walking daily/byclying)' :
          {
            av_level_min = 0.5;
            av_level_max = 0.7;
          }
          break;
        case 'Extermly high activity(going to gym )' :
          {
            av_level_min = 0.8;
            av_level_max = 1;
          }
          break;
      } // end of switch
    } //end of else if

    //calculate the uncompleted bmr
    switch (gender) { //start of switch
      case 'Male' :
        {
          unc_bmr = weight * 1 * 24; //1 for men
        }
        break;
      case 'Female' :
        {
          unc_bmr = weight * 0.9 * 24; //0.9 for women
        }
        break;
    } // end of switch

    // the lowest bound for the bmr
    bmr_min = (unc_bmr * av_level_min) + unc_bmr;
    // the highest bound for the bmr
    bmr_max = (unc_bmr * av_level_max) + unc_bmr;

    //calculate the final bmr
    switch (goal) { //start of switch
      case 'Lose weight' :
        {
          D_selector = ((bmr_min + bmr_max) / 2) - 750;
        }
        break;
      case 'Gain weight' :
        {
          D_selector = ((bmr_min + bmr_max) / 2) + 750;
        }
        break;
    } //end of switch
  }
    String choosePlan(){
      calculate();
      //choose the best plan for the use
      if (D_selector >= 1000 && D_selector <= 1499){
        Plan = 'A';
      }else if (D_selector >= 1500 && D_selector <= 1899){
        Plan = 'B';
      }else if (D_selector >= 1900 && D_selector <= 2299){
        Plan = 'C';
      }else if (D_selector >= 2300 && D_selector <= 2699){
        Plan = 'D';
      }else if (D_selector >= 2700 && D_selector <= 3099){
        Plan = 'E';
      }else if (D_selector >= 3100 && D_selector <= 3499){
        Plan = 'F';
      }else if (D_selector >= 3500 && D_selector <= 3899){
        Plan = 'G';
      }else if (D_selector >= 3900 && D_selector <= 4299){
        Plan = 'H';
      }else if (D_selector >= 4300 && D_selector <= 4699){
        Plan = 'I';
      }else if (D_selector >= 4700 && D_selector <= 5500){
        Plan = 'J';
      }
      return Plan;
    }
}