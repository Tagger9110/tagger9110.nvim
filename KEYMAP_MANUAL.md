# Neovim 단축키 매뉴얼

`<Space>`가 Leader 키입니다. `<Space>` 누르고 잠시 기다리면 which-key가 사용 가능한 키맵을 보여줍니다.

---

# 1. 기본 키맵

## 창(Window) 이동

| 키 | 설명 |
|----|------|
| `<C-h>` | 왼쪽 창으로 이동 |
| `<C-j>` | 아래 창으로 이동 |
| `<C-k>` | 위 창으로 이동 |
| `<C-l>` | 오른쪽 창으로 이동 |

### 사용 예시
```
┌─────────┬─────────┐
│  파일1  │  파일2  │  ← <C-h>, <C-l>로 좌우 이동
├─────────┴─────────┤
│      터미널       │  ← <C-j>, <C-k>로 상하 이동
└───────────────────┘
```

## 기타 기본 키맵

| 키 | 설명 |
|----|------|
| `<Esc>` | 검색 하이라이트 제거. `/검색어` 후 노란 하이라이트를 끄고 싶을 때 |
| `<Esc><Esc>` | 터미널 모드에서 Normal 모드로 전환 |

---

# 2. `<Space>` 단일 키

| 키 | 설명 |
|----|------|
| `<Space><Space>` | 열린 버퍼 목록 보기 |
| `<Space>/` | 현재 파일 내 검색 |
| `<Space>q` | 진단 목록 열기 |
| `<Space>f` | 코드 포맷팅 |
| `<Space>e` | 파일 탐색기 토글 |

### 상세 설명

#### `<Space><Space>` - 버퍼 목록
현재 열려있는 모든 파일(버퍼) 목록을 보여줍니다.
```
사용 예시:
1. 여러 파일을 열어둔 상태에서 <Space><Space>
2. 목록에서 원하는 파일 선택
3. Enter로 해당 파일로 이동
```

#### `<Space>/` - 현재 파일 내 검색
현재 편집 중인 파일에서 텍스트를 fuzzy 검색합니다.
```
사용 예시:
1. <Space>/ 입력
2. 찾고 싶은 텍스트 입력 (예: "function")
3. 결과 목록에서 선택하면 해당 위치로 이동
```

#### `<Space>q` - 진단 목록 (Quickfix)
현재 파일의 모든 에러, 경고를 목록으로 보여줍니다.
```
사용 예시:
1. LSP가 에러를 표시하고 있을 때 <Space>q
2. 모든 에러/경고가 목록으로 표시됨
3. 목록에서 선택하면 해당 위치로 이동
```

#### `<Space>f` - 코드 포맷팅
현재 파일을 자동으로 정렬/포맷합니다.
```
사용 예시:
1. 코드 작성 후 <Space>f
2. prettier, stylua 등 설정된 포맷터가 코드 정리
3. 들여쓰기, 줄바꿈 등이 자동으로 정리됨
```

#### `<Space>e` - 파일 탐색기 (Neo-tree)
왼쪽에 파일 트리를 열거나 닫습니다.
```
Neo-tree 내부 키맵:
- Enter : 파일 열기 / 폴더 열기/닫기
- a     : 새 파일/폴더 생성
- d     : 삭제
- r     : 이름 변경
- c     : 복사
- m     : 이동
- q     : Neo-tree 닫기
```

---

# 3. `<Space>s` - Search (검색)

Telescope를 이용한 강력한 검색 기능들입니다.

| 키 | 설명 |
|----|------|
| `<Space>sf` | 파일 검색 |
| `<Space>sg` | 텍스트 검색 (grep) |
| `<Space>sw` | 현재 단어 검색 |
| `<Space>sh` | 도움말 검색 |
| `<Space>sk` | 단축키 검색 |
| `<Space>ss` | Telescope 기능 목록 |
| `<Space>sd` | 진단(에러/경고) 검색 |
| `<Space>sr` | 마지막 검색 재개 |
| `<Space>s.` | 최근 파일 목록 |
| `<Space>s/` | 열린 파일들 내 검색 |
| `<Space>sn` | Neovim 설정 파일 검색 |

### 상세 설명

#### `<Space>sf` - 파일 검색 (가장 많이 사용)
프로젝트 내 모든 파일을 이름으로 검색합니다.
```
사용 예시:
1. <Space>sf 입력
2. 파일명 일부 입력 (예: "user" → UserController.java 등 표시)
3. 방향키로 선택 후 Enter

팁:
- 경로 일부도 검색 가능: "api/user" → src/api/user/index.js
- 대소문자 구분 없음
```

#### `<Space>sg` - 텍스트 검색 (grep)
프로젝트 전체에서 텍스트 내용을 검색합니다.
```
사용 예시:
1. <Space>sg 입력
2. 찾고 싶은 텍스트 입력 (예: "console.log")
3. 해당 텍스트가 포함된 모든 파일과 위치 표시
4. 선택하면 해당 파일의 해당 줄로 이동

팁:
- 함수명, 변수명, 에러 메시지 등 검색에 유용
- 정규식도 사용 가능
```

#### `<Space>sw` - 현재 단어 검색
커서가 위치한 단어를 프로젝트 전체에서 검색합니다.
```
사용 예시:
1. "getUserById" 함수 위에 커서를 놓고
2. <Space>sw 입력
3. 프로젝트에서 "getUserById"가 사용된 모든 위치 표시
```

#### `<Space>sh` - 도움말 검색
Neovim의 도움말 문서를 검색합니다.
```
사용 예시:
1. <Space>sh 입력
2. 알고 싶은 키워드 입력 (예: "keymap", "autocmd")
3. 관련 도움말 문서 목록 표시
```

#### `<Space>sk` - 단축키 검색
설정된 모든 키맵을 검색합니다.
```
사용 예시:
1. <Space>sk 입력
2. 기능 설명 입력 (예: "rename", "format")
3. 해당 기능의 단축키 확인
```

#### `<Space>ss` - Telescope 기능 목록 (Select Telescope)
Telescope가 제공하는 모든 기능(picker)을 검색합니다.
```
사용 예시:
1. <Space>ss 입력
2. Telescope의 모든 기능 목록이 표시됨
3. 기능명 입력하여 검색 (예: "git", "lsp", "treesitter")
4. 선택하면 해당 Telescope 기능 실행

표시되는 주요 항목들:
- find_files       : 파일 검색 (<Space>sf와 동일)
- live_grep        : 텍스트 검색 (<Space>sg와 동일)
- git_commits      : Git 커밋 히스토리
- git_branches     : Git 브랜치 목록
- lsp_references   : LSP 참조 (gr과 동일)
- lsp_definitions  : LSP 정의 (gd와 동일)
- treesitter       : Treesitter 심볼
- colorscheme      : 컬러스킴 미리보기
- man_pages        : man 페이지 검색
- vim_options      : Vim 옵션 목록

사용 시나리오:
- 다른 단축키가 기억나지 않을 때
- Telescope에 어떤 기능이 있는지 탐색하고 싶을 때
- 자주 안 쓰는 Telescope 기능을 찾을 때
```

#### `<Space>sr` - 마지막 검색 재개
직전에 했던 Telescope 검색을 다시 엽니다.
```
사용 예시:
1. <Space>sg로 "TODO"를 검색했다가 닫음
2. <Space>sr 입력
3. 이전 검색 결과가 그대로 다시 표시됨
```

#### `<Space>s.` - 최근 파일 목록
최근에 열었던 파일들의 목록을 보여줍니다.
```
사용 예시:
1. <Space>s. 입력
2. 최근 편집했던 파일들이 시간순으로 표시
3. 어제 작업하던 파일을 빠르게 열 수 있음
```

---

# 4. `<Space>c` - Code (코드)

| 키 | 설명 |
|----|------|
| `<Space>ca` | Code Action 실행 |

### 상세 설명

#### `<Space>ca` - Code Action
LSP가 제안하는 코드 수정 작업을 실행합니다.
```
사용 예시:

1. 자동 import:
   - 정의되지 않은 함수/클래스 위에서 <Space>ca
   - "Import ..." 선택하면 자동으로 import 문 추가

2. 퀵 픽스:
   - 에러가 있는 코드 위에서 <Space>ca
   - 제안된 수정 방법 선택

3. 리팩토링:
   - 코드 블록 선택 후 <Space>ca
   - "Extract to function" 등 리팩토링 옵션 선택

자주 나오는 옵션들:
- Import module
- Remove unused import
- Add missing return type
- Extract to variable/function
- Convert to arrow function
```

---

# 5. `<Space>d` - Document (문서)

| 키 | 설명 |
|----|------|
| `<Space>ds` | 문서 심볼 목록 |
| `<Space>D` | 타입 정의로 이동 |

### 상세 설명

#### `<Space>ds` - Document Symbols
현재 파일의 모든 심볼(함수, 변수, 클래스 등)을 목록으로 보여줍니다.
```
사용 예시:
1. 긴 파일에서 <Space>ds 입력
2. 파일 내 모든 함수, 클래스, 변수 목록 표시
3. 원하는 항목 선택하면 해당 위치로 이동

표시되는 항목:
- 함수/메서드
- 클래스/인터페이스
- 변수/상수
- import 문
```

#### `<Space>D` - Type Definition
변수나 함수의 타입 정의로 이동합니다.
```
사용 예시:
1. 변수 위에 커서를 놓고 <Space>D
2. 해당 변수의 타입이 정의된 곳으로 이동

예: const user: User = ... 에서 user 위에서 <Space>D
    → User 인터페이스/타입 정의로 이동
```

---

# 6. `<Space>r` - Rename (이름 변경)

| 키 | 설명 |
|----|------|
| `<Space>rn` | 심볼 이름 변경 |

### 상세 설명

#### `<Space>rn` - Rename
커서 위의 심볼 이름을 프로젝트 전체에서 변경합니다.
```
사용 예시:
1. 변경하고 싶은 함수/변수 이름 위에 커서
2. <Space>rn 입력
3. 새 이름 입력 후 Enter
4. 해당 심볼이 사용된 모든 곳이 자동으로 변경됨

예:
- getUserById 함수 이름을 findUserById로 변경하면
- import문, 호출부, export문 등 모든 곳이 한번에 변경됨
```

---

# 7. `<Space>w` - Workspace (워크스페이스)

| 키 | 설명 |
|----|------|
| `<Space>ws` | 워크스페이스 심볼 검색 |

### 상세 설명

#### `<Space>ws` - Workspace Symbols
프로젝트 전체에서 심볼(함수, 클래스 등)을 검색합니다.
```
사용 예시:
1. <Space>ws 입력
2. 찾고 싶은 함수/클래스명 입력 (예: "UserService")
3. 프로젝트 내 모든 일치하는 심볼 표시
4. 선택하면 해당 정의로 이동

<Space>ds vs <Space>ws:
- <Space>ds: 현재 파일 내 심볼만
- <Space>ws: 프로젝트 전체 심볼
```

---

# 8. `<Space>t` - Toggle (토글)

| 키 | 설명 |
|----|------|
| `<Space>th` | Inlay Hints 토글 |
| `<Space>tb` | Git Blame 토글 |
| `<Space>tD` | Git Deleted 토글 |

### 상세 설명

#### `<Space>th` - Inlay Hints
코드 사이에 타입 정보를 표시하거나 숨깁니다.
```
예시 (켜진 상태):
const user = getUser()  : User
              ↑ 반환 타입이 코드 옆에 표시됨

사용 시나리오:
- 타입 추론 결과를 확인하고 싶을 때 켜기
- 코드가 복잡해 보일 때 끄기
```

#### `<Space>tb` - Git Blame
현재 줄을 누가 언제 수정했는지 표시합니다.
```
예시 (켜진 상태):
42 | function getUser() {  ← John Doe, 2 days ago: Add user function

사용 시나리오:
- 코드 작성자 확인
- 마지막 수정 시점 확인
```

#### `<Space>tD` - Git Deleted
삭제된 줄을 빨간색으로 표시합니다.
```
사용 시나리오:
- 이전 커밋에서 삭제된 코드 확인
- 실수로 삭제한 코드 찾기
```

---

# 9. `<Space>h` - Harpoon (파일 즐겨찾기)

| 키 | 설명 |
|----|------|
| `<Space>ha` | 현재 파일 추가 |
| `<Space>hm` | 메뉴 열기 |
| `<Space>h1~4` | 1~4번 파일로 이동 |

### 상세 설명

자주 편집하는 핵심 파일들을 등록해두고 빠르게 전환합니다.
```
사용 시나리오:

1. 핵심 파일 등록:
   - UserController.java 열고 <Space>ha
   - UserService.java 열고 <Space>ha
   - User.java 열고 <Space>ha
   - UserTest.java 열고 <Space>ha

2. 빠른 전환:
   - <Space>h1 → UserController.java
   - <Space>h2 → UserService.java
   - ...

3. 목록 관리:
   - <Space>hm으로 메뉴 열기
   - 순서 변경, 삭제 가능

팁: 한 기능 개발 시 관련 파일 4개 정도만 등록해서 사용
```

---

# 10. `<Space>g` - Git

## Hunk (변경 블록) 관리

| 키 | 설명 |
|----|------|
| `<Space>gs` | Hunk 스테이징 |
| `<Space>gr` | Hunk 되돌리기 |
| `<Space>gS` | 파일 전체 스테이징 |
| `<Space>gR` | 파일 전체 되돌리기 |
| `<Space>gu` | 스테이징 취소 |
| `<Space>gp` | Hunk 미리보기 |
| `<Space>gb` | Blame 보기 |
| `<Space>gD` | 마지막 커밋과 diff |

### 상세 설명

#### Hunk란?
Git에서 변경된 코드 블록 단위입니다. 파일 전체가 아닌 일부분만 스테이징할 수 있습니다.
```
예시:
   10 | function foo() {
 + 11 |   console.log("debug");  ← 이 3줄이 하나의 hunk
 + 12 |   const x = 1;
 + 13 |   return x;
   14 | }
   ...
 - 50 |   // 삭제된 주석          ← 이것은 별도의 hunk
```

#### `<Space>gs` - Stage Hunk
현재 커서가 있는 변경 블록만 스테이징합니다.
```
사용 시나리오:
1. 여러 곳을 수정했는데 일부만 커밋하고 싶을 때
2. 디버그 코드는 제외하고 실제 변경만 커밋할 때
```

#### `<Space>gp` - Preview Hunk
변경 내용을 팝업으로 미리 봅니다.
```
사용 시나리오:
1. gutter의 +/- 표시가 뭔지 확인하고 싶을 때
2. 변경 전/후를 비교하고 싶을 때
```

## LazyGit

| 키 | 설명 |
|----|------|
| `<Space>gg` | LazyGit 열기 |
| `<Space>gf` | 현재 파일 LazyGit |

### 상세 설명

#### `<Space>gg` - LazyGit
터미널 기반 Git UI를 엽니다.
```
LazyGit 내부 주요 키맵:
- space : 파일 스테이지/언스테이지
- c     : 커밋 작성
- p     : 푸시
- P     : 풀
- b     : 브랜치 메뉴
- s     : stash 메뉴
- ?     : 도움말
- q     : 종료

사용 시나리오:
- 복잡한 Git 작업 (rebase, cherry-pick 등)
- 여러 파일 한번에 스테이징
- 커밋 히스토리 확인 및 수정
```

## Diffview

| 키 | 설명 |
|----|------|
| `<Space>gd` | Diff 보기 |
| `<Space>gh` | 파일 히스토리 |
| `<Space>gH` | 브랜치 히스토리 |
| `<Space>gc` | Diffview 닫기 |

### 상세 설명

#### `<Space>gd` - Diffview Open
현재 변경사항을 보기 좋게 표시합니다.
```
화면 구성:
┌─────────────────┬─────────────────┐
│   변경 전 코드   │   변경 후 코드   │
│   (빨간색 삭제)  │   (초록색 추가)  │
└─────────────────┴─────────────────┘
│ 변경된 파일 목록                    │
└─────────────────────────────────────┘

내부 키맵:
- Tab / S-Tab : 다음/이전 파일
- q           : 닫기
```

#### `<Space>gh` - File History
현재 파일의 Git 히스토리를 봅니다.
```
사용 시나리오:
- 파일이 언제 어떻게 변경되었는지 추적
- 특정 시점의 코드 확인
- 버그가 언제 도입되었는지 찾기
```

---

# 11. LSP 이동 키맵 (g 접두사)

| 키 | 설명 |
|----|------|
| `gd` | 정의로 이동 |
| `gr` | 참조 목록 |
| `gI` | 구현으로 이동 |
| `gD` | 선언으로 이동 |
| `K` | 문서/타입 정보 보기 |
| `<C-t>` | 이전 위치로 돌아가기 |

### 상세 설명

#### `gd` - Go to Definition (가장 많이 사용)
함수, 변수, 클래스의 정의로 이동합니다.
```
사용 예시:
1. getUserById() 호출부에서 gd
2. getUserById 함수가 정의된 곳으로 이동

3. <C-t>로 원래 위치로 돌아오기
```

#### `gr` - Go to References
심볼이 사용된 모든 위치를 보여줍니다.
```
사용 예시:
1. getUserById 함수 정의에서 gr
2. 이 함수가 호출된 모든 위치 목록 표시
3. 선택하면 해당 위치로 이동

사용 시나리오:
- 함수를 수정하기 전에 영향 범위 파악
- 사용되지 않는 코드 찾기
```

#### `gI` - Go to Implementation
인터페이스의 실제 구현으로 이동합니다.
```
사용 예시:
1. interface UserRepository 위에서 gI
2. UserRepositoryImpl 클래스로 이동

gd vs gI:
- gd: 인터페이스 정의로 이동
- gI: 실제 구현체로 이동
```

#### `K` - Hover (문서 보기)
커서 위 심볼의 타입 정보나 문서를 팝업으로 보여줍니다.
```
사용 예시:
1. 함수 이름 위에서 K
2. 함수 시그니처, JSDoc 주석 등 표시
```

---

# 12. Hunk 탐색 (대괄호)

| 키 | 설명 |
|----|------|
| `]c` | 다음 변경 블록으로 |
| `[c` | 이전 변경 블록으로 |

### 사용 예시
```
1. 파일 수정 후 ]c로 변경된 부분들을 순회
2. 각 변경 위치에서 <Space>gp로 미리보기
3. 필요하면 <Space>gs로 스테이징
```

---

# 13. `<Space>a` - Aerial (코드 구조)

| 키 | 설명 |
|----|------|
| `<Space>a` | Aerial 코드 Outline 토글 |

### 상세 설명

#### `<Space>a` - Aerial (Code Outline)
현재 파일의 함수, 클래스 등 구조를 우측 사이드바로 보여줍니다.
```
사용 예시:
1. <Space>a 입력
2. 우측에 파일 구조 목록 표시
   ├─ class UserService
   │   ├─ constructor()
   │   ├─ getUser()
   │   └─ saveUser()
   └─ function helper()
3. 원하는 항목에서 Enter → 해당 위치로 이동

내부 키맵:
- Enter   : 해당 심볼로 이동
- { / }   : 이전/다음 심볼
- [[ / ]] : 이전/다음 상위 심볼 (클래스 → 클래스)
- <C-v>   : 수직 분할로 열기
- <C-s>   : 수평 분할로 열기
- q       : 닫기

사용 시나리오:
- 긴 파일에서 특정 함수 빠르게 찾기
- 처음 보는 파일의 구조 파악
- 함수 간 빠른 이동
```

---

# 14. `<Space>x` - Trouble (진단 목록)

| 키 | 설명 |
|----|------|
| `<Space>xx` | 전체 프로젝트 진단 |
| `<Space>xX` | 현재 버퍼 진단 |
| `<Space>xs` | 심볼 목록 |
| `<Space>xl` | LSP 정의/참조 |
| `<Space>xL` | Location List |
| `<Space>xQ` | Quickfix List |

### 상세 설명

#### `<Space>xx` - 전체 프로젝트 진단
프로젝트 내 모든 에러, 경고를 보기 좋은 목록으로 보여줍니다.
```
사용 예시:
1. <Space>xx 입력
2. 하단에 모든 진단 목록 표시
   ┌──────────────────────────────────────────┐
   │  src/user.ts:10  Error: Type mismatch   │
   │  src/api.ts:25   Warn: Unused variable  │
   │  src/api.ts:30   Error: Missing import  │
   └──────────────────────────────────────────┘
3. j/k로 이동, Enter로 해당 파일/위치로 점프

<Space>q vs <Space>xx:
- <Space>q  : 기본 Quickfix (단순)
- <Space>xx : Trouble (더 보기 좋고 필터링 가능)
```

#### `<Space>xX` - 현재 버퍼 진단
현재 편집 중인 파일의 에러/경고만 표시합니다.
```
사용 시나리오:
- 한 파일의 문제만 집중해서 해결하고 싶을 때
- 다른 파일의 에러에 방해받지 않고 싶을 때
```

#### `<Space>xl` - LSP 정의/참조
커서 위의 심볼에 대한 정의와 참조를 한눈에 보여줍니다.
```
사용 예시:
1. 함수 이름 위에서 <Space>xl
2. 해당 함수의 정의 위치, 호출 위치 모두 표시
3. gr보다 더 정리된 형태로 확인 가능
```

---

# 15. Flash (빠른 이동)

| 키 | 설명 |
|----|------|
| `s` | 화면 내 점프 |
| `S` | Treesitter 선택 |

### 상세 설명

#### `s` - Flash Jump
화면에 보이는 어떤 위치로든 2-3번의 키 입력으로 이동합니다.
```
사용 예시:
1. s 입력
2. 이동하고 싶은 위치의 문자 입력 (예: "f")
3. 화면에서 "f"로 시작하는 위치마다 라벨(a,b,c...) 표시
4. 원하는 위치의 라벨 입력하면 즉시 이동

일반 이동과 비교:
- 기존: 10j → 3l → w → w  (여러 번 입력)
- Flash: s → f → a        (3번 입력으로 끝)
```

#### `S` - Treesitter Select
코드 구조 단위로 선택합니다.
```
사용 예시:
1. 함수 안에서 S 입력
2. 함수 전체, if 블록, 파라미터 등이 라벨로 표시
3. 라벨 선택하면 해당 블록이 Visual 모드로 선택됨

사용 시나리오:
- 함수 전체를 빠르게 선택해서 복사/삭제
- if 블록만 선택해서 이동
```

---

# 16. TODO 탐색

| 키 | 설명 |
|----|------|
| `]t` | 다음 TODO로 이동 |
| `[t` | 이전 TODO로 이동 |
| `<Space>st` | 프로젝트 전체 TODO 검색 |

### 상세 설명

todo-comments 플러그인이 TODO, FIXME, HACK, NOTE 등을 하이라이트합니다.
```
사용 예시:
1. 코드에 TODO 주석 작성
   // TODO: 나중에 리팩토링 필요

2. ]t / [t로 TODO 주석 사이 이동

3. <Space>st로 프로젝트 전체 TODO 검색
   → Telescope에서 모든 TODO 목록 확인
```

---

# 17. Surround (텍스트 감싸기)

| 키 | 설명 |
|----|------|
| `ys{motion}{char}` | 텍스트 감싸기 |
| `ds{char}` | 감싼 것 제거 |
| `cs{old}{new}` | 감싼 것 변경 |

### 상세 설명

#### 감싸기 (ys)
```
ysiw"  → 커서 위 단어를 "로 감싸기
        hello → "hello"

ys$)   → 커서부터 줄 끝까지 ()로 감싸기

yss"   → 전체 줄을 "로 감싸기
```

#### 제거 (ds)
```
ds"    → 따옴표 제거
        "hello" → hello

ds(    → 괄호 제거
        (hello) → hello
```

#### 변경 (cs)
```
cs"'   → " → ' 변경
        "hello" → 'hello'

cs([   → () → [] 변경
        (hello) → [hello]
```

#### Visual 모드
```
1. v로 텍스트 선택
2. S" 입력
3. 선택된 텍스트가 "로 감싸짐
```

---

# 18. `<Space>m` - Markdown

| 키 | 설명 |
|----|------|
| `<Space>mp` | 마크다운 미리보기 토글 |

### 상세 설명

마크다운 파일을 브라우저에서 실시간 미리보기합니다.
```
사용 예시:
1. README.md 파일 열기
2. <Space>mp 입력
3. 브라우저가 열리며 미리보기 표시
4. 파일 수정하면 브라우저도 실시간 갱신
5. 다시 <Space>mp로 종료
```

---

# 19. 터미널

| 키 | 설명 |
|----|------|
| `<C-\>` | 터미널 토글 (플로팅) |
| `<Space>tf` | 플로팅 터미널 |
| `<Space>t-` | 하단 수평 터미널 |
| `<Space>tv` | 우측 수직 터미널 |
| `<Space>tg` | LazyGit (터미널) |

### 상세 설명

#### `<C-\>` - 터미널 토글
플로팅 터미널을 열거나 닫습니다.
```
사용 예시:
1. <C-\> 입력 → 플로팅 터미널 열림
2. npm run dev 등 명령 실행
3. <C-\> 입력 → 터미널 숨김 (백그라운드 실행 유지)
4. 다시 <C-\> → 이전 터미널 다시 표시

터미널 내에서:
- <Esc><Esc>로 Normal 모드 전환
- <C-\>로 터미널 숨기기
```

#### 터미널 방향별 키맵
```
<Space>tf : 플로팅 (화면 중앙)
<Space>t- : 수평 (하단)
<Space>tv : 수직 (우측)
```

---

# 20. `<Space>z` - Zen Mode (집중 모드)

| 키 | 설명 |
|----|------|
| `<Space>z` | Zen Mode 토글 |
| `<Space>tw` | Twilight 토글 |

### 상세 설명

#### `<Space>z` - Zen Mode
모든 방해 요소를 제거하고 코드에만 집중합니다.
```
적용되는 효과:
- 파일 트리, 상태바 숨김
- 라인 번호 숨김
- 코드가 화면 중앙에 120 컬럼 너비로 배치
- Twilight 자동 활성화 (주변 코드 어둡게)

사용 시나리오:
- 복잡한 함수 작성에 집중할 때
- 코드 리뷰나 발표할 때
- 문서 작성할 때
```

#### `<Space>tw` - Twilight
현재 편집 중인 코드 블록만 밝게, 나머지는 어둡게 표시합니다.
```
사용 예시:
1. <Space>tw로 Twilight 활성화
2. 커서가 있는 함수/블록만 밝게 표시
3. 다른 위치로 이동하면 해당 블록이 밝게 변경
4. 다시 <Space>tw로 비활성화

Zen Mode와의 차이:
- Zen Mode: 화면 레이아웃 자체를 변경
- Twilight: 코드 밝기만 조절 (레이아웃 유지)
```

---

# 21. `<Space>b` - Buffer (버퍼 관리)

| 키 | 설명 |
|----|------|
| `<S-h>` | 이전 버퍼 |
| `<S-l>` | 다음 버퍼 |
| `<Space>bp` | 버퍼 고정 (Pin) |
| `<Space>bP` | 고정 안된 버퍼 모두 닫기 |
| `<Space>bo` | 다른 버퍼 모두 닫기 |
| `<Space>br` | 오른쪽 버퍼 모두 닫기 |
| `<Space>bl` | 왼쪽 버퍼 모두 닫기 |
| `<Space>1~5` | 1~5번 버퍼로 이동 |

### 상세 설명

#### 버퍼 이동
```
사용 예시:
1. 여러 파일을 열면 상단에 탭처럼 표시됨
2. Shift+h로 왼쪽 버퍼로 이동
3. Shift+l로 오른쪽 버퍼로 이동
4. <Space>1~5로 특정 위치 버퍼로 직접 이동
```

#### 버퍼 정리
```
사용 예시:
1. <Space>bp로 중요한 파일 고정 (Pin)
2. <Space>bP로 고정 안된 파일들 모두 닫기
3. 고정된 파일만 남음

다른 정리 방법:
- <Space>bo: 현재 버퍼 제외하고 모두 닫기
- <Space>br: 현재 버퍼 오른쪽 모두 닫기
- <Space>bl: 현재 버퍼 왼쪽 모두 닫기
```

### Harpoon과의 차이
```
Harpoon (<Space>h):
- 프로젝트별 고정 파일 4개 등록
- 파일을 닫아도 목록 유지

Bufferline (<Space>b):
- 현재 열린 모든 파일 표시
- 파일을 닫으면 목록에서 사라짐
- 시각적으로 현재 상태 확인 가능
```

---

# 22. `<Space>y` - Yank (클립보드 히스토리)

| 키 | 모드 | 설명 |
|----|------|------|
| `p` | Normal, Visual | 붙여넣기 (커서 뒤) |
| `P` | Normal, Visual | 붙여넣기 (커서 앞) |
| `<C-p>` | Normal | 이전 yank 항목으로 변경 |
| `<C-n>` | Normal | 다음 yank 항목으로 변경 |
| `<Space>y` | Normal | Yank 히스토리 목록 열기 |

### 상세 설명

#### 기본 동작
`p`와 `P`는 기존 Vim 동작과 동일하지만, yanky.nvim이 히스토리를 관리합니다.
```
사용 예시:
1. yy로 줄 복사 (A)
2. 다른 줄에서 yy로 복사 (B)
3. 또 다른 줄에서 yy로 복사 (C)
4. p로 붙여넣기 → C가 붙여짐
5. <C-p> 입력 → 방금 붙인 C가 B로 변경됨
6. <C-p> 입력 → B가 A로 변경됨
```

#### `<Space>y` - Yank 히스토리
복사한 모든 내용을 목록으로 보여줍니다.
```
사용 예시:
1. <Space>y 입력
2. 최근 복사한 텍스트 목록 표시
3. 원하는 항목 선택하면 현재 위치에 붙여넣기

사용 시나리오:
- 오래 전에 복사한 내용이 다시 필요할 때
- 여러 텍스트를 복사해두고 선택적으로 붙여넣을 때
```

### 특징

- SQLite로 저장되어 Neovim 재시작 후에도 히스토리 유지
- 최대 100개 히스토리 저장
- 붙여넣기 시 하이라이트로 위치 표시

---

# 23. 요약 치트시트

```
[검색 - 가장 많이 사용]
<Space>sf      - 파일명으로 검색
<Space>sg      - 텍스트로 검색 (grep)
<Space>sw      - 커서 단어 검색
<Space><Space> - 열린 버퍼 목록

[코드 작업]
<Space>ca      - 코드 액션 (자동 import, 퀵픽스)
<Space>rn      - 이름 변경 (리팩토링)
<Space>ds      - 파일 내 심볼 목록
<Space>f       - 코드 포맷팅
gd / gr / gI   - 정의/참조/구현 이동
K              - 문서 보기

[코드 구조]
<Space>a       - Aerial 토글 (함수/클래스 목록)
<Space>xx      - 전체 진단 목록 (Trouble)
<Space>xX      - 현재 버퍼 진단
<Space>xl      - LSP 정의/참조 목록

[파일 관리]
<Space>e       - 파일 탐색기
<Space>ha      - Harpoon 추가
<Space>h1~4    - Harpoon 파일 이동

[Git]
<Space>gg      - LazyGit 열기
<Space>gs      - 변경 블록 스테이지
<Space>gp      - 변경 내용 미리보기
<Space>gd      - diff 보기
]c / [c        - 다음/이전 변경 블록

[빠른 이동]
s              - Flash 점프
<C-h/j/k/l>    - 창 이동

[편의 기능]
]t / [t        - 다음/이전 TODO
<Space>st      - TODO 검색
ysiw" / ds" / cs"' - Surround (감싸기/제거/변경)

[Yank 히스토리]
p / P          - 붙여넣기 (히스토리 연동)
<C-p> / <C-n>  - 이전/다음 yank로 변경
<Space>y       - Yank 히스토리 열기

[집중 모드]
<Space>z       - Zen Mode 토글 (방해 요소 제거)
<Space>tw      - Twilight 토글 (주변 코드 어둡게)

[버퍼 관리]
<S-h> / <S-l>  - 이전/다음 버퍼
<Space>bp      - 버퍼 고정 (Pin)
<Space>bo      - 다른 버퍼 닫기
<Space>1~5     - 1~5번 버퍼 이동

[기타]
<Space>mp      - 마크다운 미리보기
<C-u/d/b/f>    - 부드러운 스크롤 (자동)

[터미널]
<C-\>          - 터미널 토글
<Space>tf      - 플로팅 터미널
<Space>t-      - 하단 터미널
<Space>tv      - 우측 터미널
```
