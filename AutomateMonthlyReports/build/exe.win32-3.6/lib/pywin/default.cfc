�   �00000409�   3
�X  馊�M��idle extensions{� [   zFormatParagraphzCallTips0�keys{r   {)�Q   �   z<<format-paragraph>>)�W   �   zViewWhitespace)�8   �   zViewWhitespace)�F   r	   zViewFixedFont)�   r   z<<expand-word>>)�    r   z<<expand-word>>)�9   �   z<<paren-open>>)�0   r   z<<paren-close>>)�&   �    z<<check-calltip-cancel>>)�(   r   z<<check-calltip-cancel>>)�%   r   z<<check-calltip-cancel>>)�'   r   z<<check-calltip-cancel>>)�   r   zKeyDot)�x   r   zDbgBreakpointToggle)�t   r   zDbgGo)r   r   zDbgClose)�z   r   zDbgStep)�y   r   zDbgStepOver)r   r   z
DbgStepOut)�r   r   zAutoFindNext0zeditor{)�q   r   zGotoNextBookmark)r   r   zToggleBookmark)�G   r   zGotoLine)�I   r   zShowInteractiveWindow)�B   r   z	AddBanner)�3   r   z<<comment-region>>)r   �   z<<uncomment-region>>)�4   r   z<<uncomment-region>>)�5   r   z<<tabify-region>>)�6   r   z<<untabify-region>>)�   r   z<<smart-backspace>>)�T   r   z<<toggle-tabs>>)�U   r   z<<change-indentwidth>>)�   r   zEnterKey)�	   r   zTabKey)r(   r   z<<dedent-region>>)�k   r   z
FoldExpand)r)   r   zFoldExpandAll)r)   r   zFoldExpandSecondLevel)�m   r   zFoldCollapse)r*   r   zFoldCollapseAll)r*   r   zFoldCollapseSecondLevel)�j   r   zFoldTopLevel0zinteractive{)r   r   z<<history-previous>>)r   r   z<<history-next>>)r'   r   zProcessEnter)r'   r   zProcessEnter)r'   r   zProcessEnter)�   r   z
ProcessEsc)r   r   z
WindowBack)�$   r   zInteractiveHome)r-   r   zInteractiveHomeExtend)r(   r   zMDINext)r(   r	   zMDIPrev00�extension codec               @   sD   d d� Z dd� Zdd� Zdd� Zdd	� Zd
d� Zdd� Zdd� ZdS )c             C   sr   | j }dd }d||f }|jd�}|j�  |j||� |j�  dd� |jd�D �\}}|jdd	|d
 f � d S )N�#r
   z%s
## 
## 
## 
%s
zinsert linestartc             S   s   g | ]}t |��qS � )�int)�.0�sr0   r0   �jC:\Users\Ratajczyk\AppData\Local\Programs\Python\Python36-32\Lib\site-packages\Pythonwin\pywin\default.cfg�
<listcomp>�   s    zAddBanner.<locals>.<listcomp>�.�insertz%d.1 lineend�   )�text�index�undo_block_startr7   �undo_block_stop�split�mark_set)�editor_window�eventr9   Zbig_line�banner�pos�line�colr0   r0   r4   �	AddBanner�   s    
rE   c             C   s   t | jd�S )Nr   )�_DoInteractiveHomer9   )r?   r@   r0   r0   r4   �InteractiveHome�   s    rG   c             C   s   t | jd�S )N�   )rF   r9   )r?   r@   r0   r0   r4   �InteractiveHomeExtend�   s    rI   c             C   sv   dd l }| jj� rdS dt|j� }| jdd|� rR| jd|�|j|jgkrR|}nd}|r`d}n|}| jd||� d S )Nr   rH   zinsert linestart + %d cr7   z==zinsert linestart�sel)	�sys�edit�SCIAutoCActive�len�ps1�compare�get�ps2�tag_add)r9   �extendrK   Zof_interest�end�startr0   r0   r4   rF   �   s    
 rF   c       
      C   s�   ddl m} ddl m} y|| j}|j� }|rB||j_|j� |j_nP|j	|j
�}|j	|j|d�}|j	|j|d�}|j||�}|r�||j_||f|j_W n$ tk
r�   ddl}	|	j�  Y nX |j�  dS )z'find selected text or word under cursorr   )�find)�scintillaconrH   N)�pywin.scintillarW   rX   rL   �
GetSelTextZ
lastSearch�findText�GetSelrJ   �SendScintilla�SCI_GETCURRENTPOS�SCI_WORDSTARTPOSITION�SCI_WORDENDPOSITION�GetTextRange�	Exception�	traceback�	print_exc�FindNext)
r?   r@   rW   rX   Zsci�wordrB   rV   rU   rc   r0   r0   r4   �AutoFindNext�   s&    rg   c             C   s   | j j�  d S )N)r9   Zbeep)r?   r@   r0   r0   r4   �Beep�   s    rh   c             C   s   d S )Nr0   )r?   r@   r0   r0   r4   �	DoNothing�   s    ri   c             C   s   dS )NrH   r0   )r?   r@   r0   r0   r4   �ContinueEvent�   s    rj   N)rE   rG   rI   rF   rg   rh   ri   rj   r0   r0   r0   r4   �<module>�   s   0