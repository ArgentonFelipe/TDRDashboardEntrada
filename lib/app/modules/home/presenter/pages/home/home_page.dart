import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:signals/signals_flutter.dart';

import '../../../../../shared/presenter/components/default_loading/default_loading.dart';
import '../../../../../shared/utils/helpers/messages/messages.dart';
import '../../../../../shared/utils/styles/colors_app/colors_app.dart';
import '../../../../../shared/utils/styles/text_styles/text_styles.dart';
import 'components/employee_chip/employee_chip.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> with MessageViewMixin {
  final controller = Modular.get<HomeController>();
  final employeeNameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    scheduleMicrotask(() {
      this.controller.getAllEmployees();
    });
  }

  @override
  void dispose() {
    employeeNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            Text(
                              'Conferentes',
                              style: context.textStyles.title,
                            ),
                            const SizedBox(height: 10),
                            Watch(
                              (_) {
                                return TextField(
                                  controller: employeeNameController,
                                  enabled: !this.controller.isEmployessLoading,
                                  decoration: InputDecoration(
                                    label: const Text(
                                      'Pesquise o Nome do Conferente',
                                    ),
                                    isDense: true,
                                    suffix: IconButton(
                                      icon: Icon(
                                        Icons.delete,
                                        size: 20,
                                        color: context.colors.primary,
                                      ),
                                      onPressed: () {
                                        employeeNameController.clear();
                                        this
                                            .controller
                                            .searchEmployeeWithName('');
                                      },
                                    ),
                                  ),
                                  onChanged:
                                      this.controller.searchEmployeeWithName,
                                );
                              },
                            ),
                            const SizedBox(height: 10),
                            Watch(
                              (_) {
                                final employees = this.controller.employees;
                                return Expanded(
                                  child: Visibility(
                                    visible: this.controller.isEmployessLoading,
                                    replacement: Visibility(
                                      visible:
                                          this.controller.employees.isNotEmpty,
                                      replacement: Text(
                                        'Não encontramos nenhum conferente cadastrado',
                                        style: context.textStyles.subtitle,
                                        textAlign: TextAlign.center,
                                      ),
                                      child: ListView.separated(
                                        itemCount: employees.length,
                                        itemBuilder: (_, index) {
                                          final employee = employees[index];
                                          return ListTile(
                                            title: Text(
                                              '${employee.userId} - ${employee.displayName}',
                                              style:
                                                  context.textStyles.subtitle,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                            trailing: IconButton(
                                              icon: Icon(
                                                color: context.colors.primary,
                                                Icons.arrow_forward_ios_rounded,
                                                size: 15,
                                              ),
                                              onPressed: () {},
                                            ),
                                          );
                                        },
                                        separatorBuilder: (context, index) {
                                          return const Divider();
                                        },
                                      ),
                                    ),
                                    child: Column(
                                      children: [
                                        DefaultLoading(
                                          color: context.colors.primary,
                                        ),
                                        const SizedBox(height: 10),
                                        Text(
                                          'Estamos buscando a lista de conferentes, por favor aguarde',
                                          textAlign: TextAlign.center,
                                          style: context.textStyles.subtitle,
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 4,
                    child: Column(
                      children: [
                        Wrap(
                          spacing: 10,
                          children: [
                            EmployeeChip(
                              label: 'Todos',
                              canDelete: false,
                              onDelete: () {},
                              onSelected: () {},
                            ),
                            EmployeeChip(
                              label: 'Felipe Argnton',
                              onDelete: () {},
                              onSelected: () {},
                            ),
                          ],
                        ),
                        Expanded(
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Container(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
