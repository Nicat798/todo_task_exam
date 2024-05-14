import 'package:flutter/material.dart';
import 'package:todo_exam/core/consts/app_colors.dart';
import 'package:todo_exam/model/todo_model.dart';
import 'package:todo_exam/service/api_service.dart';
import 'package:todo_exam/views/home/widgets/custom_icon_button.dart';
import 'package:todo_exam/views/home/widgets/custom_number_circle_container.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<TodoModel>? allTasks = [];
  @override
  void initState() {
    ApiService().getTodoList().then((value) {
      setState(() {
        allTasks = value;
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'ToDo List Exam',
          style: TextStyle(color: Colors.purple, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      body: (allTasks == null && allTasks!.isEmpty)
          ? const CircularProgressIndicator()
          : ListView.builder(
              itemCount: allTasks?.length ?? 0,
              itemBuilder: (BuildContext context, int index) {
                TodoModel currentTodoModel = allTasks![index];
                return Dismissible(
                  key: ValueKey(allTasks![index]),
                  onDismissed: (DismissDirection direction) {
                    setState(() {
                      allTasks!.remove(currentTodoModel);
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 15),
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      width: double.infinity,
                      height: 80,
                      decoration: BoxDecoration(
                        color: currentTodoModel.completed!
                            ? AppColors.softGreen
                            : AppColors.softRed,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        children: [
                          CustomNumberCircleContainer(
                            isCompleted: currentTodoModel.completed!,
                            currentTodoId: currentTodoModel.id.toString(),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          Flexible(
                            child: Text(
                              currentTodoModel.title!,
                              maxLines: 1,
                              style: const TextStyle(
                                  color: AppColors.generalRed,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 17),
                            ),
                          ),
                          const Spacer(),
                          CustomIconButton(
                            onTap: () {},
                            isCompleted: currentTodoModel.completed!,
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
