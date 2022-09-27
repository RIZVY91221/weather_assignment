
class MenuModel{
  int? id;
  String? value;
  String? name;
  String? imagePath;
  List<SubCategory>? subCategory;

  MenuModel({this.id, this.value, this.name, this.imagePath,this.subCategory});
}
class SubCategory{
  int? id;
  int? mainCategoryId;
  String? value;
  String? name;
  String? imagePath;
  List<SubSubCategory>? subSubCategory;
  SubCategory({this.id, this.mainCategoryId, this.value, this.name, this.imagePath,this.subSubCategory});
}
class SubSubCategory{
  int? id;
  int? mainCategoryId;
  int? subCategoryId;
  String? value;
  String? name;
  String? imagePath;

  SubSubCategory({this.id, this.mainCategoryId,this.subCategoryId, this.value, this.name, this.imagePath});
}
List<MenuModel>menuList=[
  MenuModel(id: 1,value: "Leave",name: "Leave",imagePath: "assets/icons/leave.png",
      subCategory: <SubCategory>[
        SubCategory(id: 1,mainCategoryId:1,value: "Leave Report",name: "Leave Report",imagePath: "assets/icons/report.png",
            subSubCategory: <SubSubCategory>[
              SubSubCategory(
                  id: 1,
                  mainCategoryId: 1,
                  subCategoryId: 1,
                  value: "Leave Report Summary",
                  name: "Leave Report Summary",
                  imagePath: "assets/icons/report.png"),
              SubSubCategory(
                  id: 2,
                  mainCategoryId: 2,
                  subCategoryId: 1,
                  value: "My Leave Report",
                  name: "My Leave Report",
                  imagePath: "assets/icons/add_report.png"),

            ]),
        SubCategory(id: 2,mainCategoryId:1,value: "Leave Entry",name: "Leave Entry",imagePath: "assets/icons/add_report.png"),
      ]),

  MenuModel(
      id: 2,
      value: "Training",
      name: "Training",
      imagePath: "assets/icons/traning.png",
      subCategory: <SubCategory>[
        SubCategory(
            id: 1,
            mainCategoryId: 2,
            value: "Local",
            name: "Local",
            imagePath: "assets/icons/local_training.png",
            subSubCategory: <SubSubCategory>[
              SubSubCategory(
                  id: 1,
                  mainCategoryId: 2,
                  subCategoryId: 1,
                  value: "Local Training Report",
                  name: "Training Report",
                  imagePath: "assets/icons/report.png"),
              SubSubCategory(
                  id: 2,
                  mainCategoryId: 2,
                  subCategoryId: 1,
                  value: "Local Training Entry",
                  name: "Training Entry",
                  imagePath: "assets/icons/add_report.png"),
              SubSubCategory(
                  id: 1,
                  mainCategoryId: 2,
                  subCategoryId: 1,
                  value: "Notification",
                  name: "Notification",
                  imagePath: "assets/icons/notification.png"),
            ]),
        SubCategory(
            id: 2,
            mainCategoryId: 2,
            value: "Foreign",
            name: "Foreign",
            imagePath: "assets/icons/add_report.png",
            subSubCategory: <SubSubCategory>[
              SubSubCategory(
                  id: 1,
                  mainCategoryId: 2,
                  subCategoryId: 2,
                  value: "Foreign Training Report",
                  name: "Training Report",
                  imagePath: "assets/icons/report.png"),
              SubSubCategory(
                  id: 2,
                  mainCategoryId: 2,
                  subCategoryId: 2,
                  value: "Foreign Training Entry",
                  name: "Training Entry",
                  imagePath: "assets/icons/add_report.png"),
              SubSubCategory(
                  id: 1,
                  mainCategoryId: 2,
                  subCategoryId: 2,
                  value: "Notification",
                  name: "Notification",
                  imagePath: "assets/icons/report.png"),
            ]),
      ]),
  MenuModel(id: 3,value: "Meeting",name: "Meeting",imagePath: "assets/icons/local_metting.png",
      subCategory: <SubCategory>[
        SubCategory(
            id: 1,
            mainCategoryId: 3,
            value: "Meeting Report",
            name: "Report",
            imagePath: "assets/icons/report.png",
            subSubCategory: <SubSubCategory>[
              SubSubCategory(
                  id: 1,
                  mainCategoryId: 3,
                  subCategoryId: 1,
                  value: "Meeting Report Page",
                  name: "Meeting Report",
                  imagePath: "assets/icons/report.png"),
              SubSubCategory(
                  id: 2,
                  mainCategoryId: 3,
                  subCategoryId: 1,
                  value: "Task Assign Report page",
                  name: "Task Assign Report",
                  imagePath: "assets/icons/report.png"),
            ]),
        SubCategory(
            id: 2,
            mainCategoryId: 3,
            value: "Meeting Entry",
            name: "Entry",
            imagePath: "assets/icons/add_metting.png",
            subSubCategory: <SubSubCategory>[
              SubSubCategory(
                  id: 1,
                  mainCategoryId: 3,
                  subCategoryId: 2,
                  value: "Meeting Entry Form",
                  name: "Meeting Entry",
                  imagePath: "assets/icons/add_metting.png"),
              SubSubCategory(
                  id: 2,
                  mainCategoryId: 3,
                  subCategoryId: 2,
                  value: "Task Assign Entry Form",
                  name: "Task Assign Entry",
                  imagePath: "assets/icons/add_report.png"),
            ]),
        SubCategory(
            id: 3,
            mainCategoryId: 3,
            value: "Meeting Notification",
            name: "Notification",
            imagePath: "assets/icons/notification.png",
            subSubCategory: <SubSubCategory>[
              SubSubCategory(
                  id: 1,
                  mainCategoryId: 3,
                  subCategoryId: 3,
                  value: "Meeting Notification",
                  name: "Meeting Notification",
                  imagePath: "assets/icons/notification.png"),
              SubSubCategory(
                  id: 2,
                  mainCategoryId: 3,
                  subCategoryId: 3,
                  value: "Task Assign Notification",
                  name: "Task Assign Notification",
                  imagePath: "assets/icons/notification.png"),
            ]),
      ]),
  MenuModel(id: 4,value: "Other Activity",name: "Other Activity",imagePath: "assets/icons/other_activity.png",
      subCategory: <SubCategory>[
    SubCategory(id: 1,mainCategoryId:4,value: "Other Activity Report",name: "Activity Report",imagePath: "assets/icons/report.png"),
    SubCategory(id: 2,mainCategoryId:4,value: "Other Activity Entry",name: "Activity Entry",imagePath: "assets/icons/add_report.png"),
    SubCategory(id: 3,mainCategoryId:4,value: "Other Activity Notification",name: "Activity Notification",imagePath: "assets/icons/notification.png"),
  ]),
  MenuModel(id: 5,value: "Attendance",name: "Attendance",imagePath: "assets/icons/attendence.png",
      subCategory: <SubCategory>[
        SubCategory(id: 1,mainCategoryId:5,value: "My Attendance Report",name: "My Report",imagePath: "assets/icons/report.png"),
        SubCategory(id: 2,mainCategoryId:5,value: "Other Attendance Report",name: "Other Report",imagePath: "assets/icons/report.png"),
      ]),
  MenuModel(id: 6,value: "Report",name: "Report",imagePath: "assets/icons/report.png",
      subCategory: <SubCategory>[
        SubCategory(id: 1,mainCategoryId:6,value: "Busy Office Report",name: "Busy Report",imagePath: "assets/icons/report.png"),
        SubCategory(id: 2,mainCategoryId:6,value: "Free Office Report",name: "Free Report",imagePath: "assets/icons/report.png"),
      ]),
];
