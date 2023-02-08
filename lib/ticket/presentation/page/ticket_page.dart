import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ticket_app/ticket/presentation/bloc/ticket_cubit.dart';
import 'package:ticket_app/ticket/presentation/bloc/ticket_state.dart';
import 'package:ticket_app/ticket/presentation/enum/ticket_filter.dart';
import 'package:ticket_app/ticket/presentation/widgets/segmented_title.dart';
import 'package:ticket_app/ticket/presentation/widgets/ticket_card.dart';
import 'package:ticket_app/ticket/utils/ticket_helper.dart';

class TicketPage extends StatefulWidget {
  const TicketPage({super.key});

  @override
  State<TicketPage> createState() => _TicketPageState();
}

class _TicketPageState extends State<TicketPage> {
  TicketFilter _filter = TicketFilter.day;
  @override
  Widget build(BuildContext context) {
    const spacer10 = SizedBox(height: 10);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ticket Details"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          spacer10,
          CupertinoSegmentedControl<TicketFilter>(
            groupValue: _filter,
            padding: EdgeInsets.zero,
            children: const {
              TicketFilter.day: SegmentedTitle(title: "DAY"),
              TicketFilter.week: SegmentedTitle(title: "WEEK"),
              TicketFilter.month: SegmentedTitle(title: "MONTH"),
              TicketFilter.year: SegmentedTitle(title: "YEAR"),
            },
            onValueChanged: (filter) {
              setState(() {
                _filter = filter;
              });
            },
          ),
          spacer10,
          Expanded(
            child: BlocBuilder<TicketCubit, TicketState>(
              builder: (context, state) {
                if (state is TicketInitial) {
                  return Container();
                }
                if (state is TicketFailed) {
                  return Text(state.failure.message);
                }

                if (state is TicketLoaded) {
                  return GridView.builder(
                    itemCount: TicketHelper.getData(
                            history: state.data, filter: _filter)
                        .length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2),
                    itemBuilder: (context, index) {
                      final ticket = TicketHelper.getData(
                          history: state.data, filter: _filter)[index];
                      return TicketCard(
                        icon: TicketHelper.getIconFromLabel(ticket.label),
                        title: ticket.label,
                        count: ticket.value ?? "0",
                      );
                    },
                  );
                }

                return const CircularProgressIndicator.adaptive();
              },
            ),
          )
        ],
      ),
    );
  }
}
