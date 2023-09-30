import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pathfinder/engine/model/graph/node_template.dart';

part 'new_node_template_state.freezed.dart';

@freezed
sealed class NewNodeTemplateState with _$NewNodeTemplateState {
  const factory NewNodeTemplateState.ready({
    required NewNodeTemplateValues values,
  }) = NewNodeTemplateStateReady;

  const factory NewNodeTemplateState.finished({
    required NewNodeTemplateValues values,
  }) = NewNodeTemplateStateFinished;
}

@freezed
class NewNodeTemplateValues with _$NewNodeTemplateValues {
  const factory NewNodeTemplateValues({
    @Default(NodeTemplate(name: "")) NodeTemplate template,
    @Default([]) List<String> invalidKeys,
  }) = _NewNodeTemplateValues;
}
