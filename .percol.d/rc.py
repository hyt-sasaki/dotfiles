# Run command file for percol
from percol.key import SPECIAL_KEYS

# keymap
SPECIAL_KEYS.update({
    27: '<ESC>',
    219: '['
})

percol.import_keymap({
    "C-x" : lambda percol: percol.command.delete_forward_char(),
    "C-y" : lambda percol: percol.command.yank(),
    "C-h" : lambda percol: percol.command.backward_char(),
    "C-l" : lambda percol: percol.command.forward_char(),
    "C-n" : lambda percol: percol.command.select_next(),
    "C-p" : lambda percol: percol.command.select_previous(),
    "C-f" : lambda percol: percol.command.select_next_page(),
    "C-b" : lambda percol: percol.command.select_previous_page(),
    "C-[" : lambda percol: percol.cancel(),
    "<ESC>" : lambda percol: percol.cancel()
})
