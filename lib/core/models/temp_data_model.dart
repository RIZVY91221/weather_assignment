class LeaveType{
  int? id;
  int? typeId;
  String? typeName;

  LeaveType(this.id, this.typeId, this.typeName);
}
List<LeaveType>leaveTypeList=[
  LeaveType(1, 1, "Casual Leave"),
  LeaveType(2, 2, "Sick Leave"),
  LeaveType(3, 3, "Medical Leave")
];

class EmployModel{
  int? id;
  int? enrolId;
  String? name;

  EmployModel(this.id, this.enrolId, this.name);
}

List<EmployModel>employeeList=[
  EmployModel(1, 1, "Rizvy Ahmed"),
  EmployModel(2, 2, "SBM Soikot"),
  EmployModel(3, 3, "Mr. Ocean")
];
List<EmployModel> getSuggestionsEmployee(String query) {
  List<EmployModel> matches = List.empty(growable: true);
  matches.addAll(employeeList);
  matches.retainWhere((s) => s.name!.toLowerCase().contains(query.toLowerCase()));
  return matches;
}