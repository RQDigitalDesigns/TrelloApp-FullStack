import Constants  from '../constants';

const Actions = {
  showMembersForm: (show) => {
    return dispatch => {
      dispatch({
        type: Constants.CURRENT_BOARD_SHOW_MEMBERS_FORM,
        show: show,
      });
    };
  },
  connectToChannel: (socket, boardId) => {
    return dispatch => {
      const channel = socket.channel(`boards:${boardId}`);

      dispatch({ type: Constants.CURRENT_BOARD_FETCHING });

      channel.join().receive('ok', (response) => {
        dispatch({
          type: Constants.BOARDS_SET_CURRENT_BOARD,
          board: response.board,
        });

      channel.on('member:added', (msg) => {
        dispatch({
          type: Constants.CURRENT_BOARD_MEMBER_ADDED,
          user: msg.user,
        });
      });

        dispatch({
          type: Constants.CURRENT_BOARD_CONNECTED_TO_CHANNEL,
          channel: channel,
        });
      });
    };
  },
};
export default Actions;
