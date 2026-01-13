# Neovim 플러그인 매뉴얼

---

# 1. 생산성 향상

## 1.1 autopairs (nvim-autopairs)

괄호, 따옴표 등을 자동으로 닫아주는 플러그인

### 사용법

| 입력 | 결과 |
|------|------|
| `(` | `()` 커서는 중간에 |
| `{` | `{}` |
| `[` | `[]` |
| `'` | `''` |
| `"` | `""` |
| `` ` `` | ``` `` ``` |

### 특징
- 자동완성(nvim-cmp)과 연동됨
- 함수 자동완성 후 `(` 자동 추가

---

## 1.2 nvim-ts-autotag

HTML, Vue, JSX 등에서 태그를 자동으로 닫아주는 플러그인

### 사용법

| 입력 | 결과 |
|------|------|
| `<div>` | `<div></div>` 커서는 중간에 |
| `<template>` | `<template></template>` |
| `<MyComponent>` | `<MyComponent></MyComponent>` |

### 특징
- 여는 태그 이름 수정 시 닫는 태그도 자동 수정
- Vue, React, HTML 모두 지원

---

## 1.3 flash.nvim

화면 내 원하는 위치로 빠르게 이동하는 플러그인

### 키맵

| 키 | 모드 | 설명 |
|----|------|------|
| `s` | Normal, Visual, Operator | Flash 점프 |
| `S` | Normal, Visual, Operator | Treesitter 기반 선택 |
| `r` | Operator | 원격 Flash (operator 대기 중 사용) |
| `R` | Operator, Visual | Treesitter 검색 |

### 사용 예시

1. **기본 점프 (`s`)**
   - `s` 누르고 이동할 위치의 문자 입력
   - 화면에 라벨이 표시됨
   - 라벨 문자 입력하면 해당 위치로 이동

2. **Treesitter 선택 (`S`)**
   - `S` 누르면 코드 블록 단위로 선택 가능
   - 함수, 조건문, 클래스 등 구조 단위 선택

3. **Operator와 함께 사용**
   - `ds` → Flash로 이동한 위치까지 삭제
   - `ys` → Flash로 이동한 위치까지 복사
   - `cs` → Flash로 이동한 위치까지 변경

---

## 1.4 harpoon

자주 사용하는 파일을 즐겨찾기에 등록하고 빠르게 전환하는 플러그인

### 키맵 (`<Space>h`)

| 키 | 설명 |
|----|------|
| `<leader>ha` | 현재 파일을 Harpoon 목록에 추가 |
| `<leader>hm` | Harpoon 메뉴 열기/닫기 |
| `<leader>h1` | 1번 파일로 이동 |
| `<leader>h2` | 2번 파일로 이동 |
| `<leader>h3` | 3번 파일로 이동 |
| `<leader>h4` | 4번 파일로 이동 |

### 사용 시나리오

1. **파일 등록** - `<Space>ha`로 Harpoon 목록에 추가
2. **파일 전환** - `<Space>h1` ~ `<Space>h4`로 즉시 전환
3. **목록 관리** - `<Space>hm`으로 메뉴 열기, `dd`로 제거

---

# 2. Git 작업

모든 Git 관련 키맵은 `<Space>g` 그룹에 있습니다.

## 2.1 gitsigns.nvim

Git 변경사항을 gutter에 표시하고, hunk 단위로 관리하는 플러그인

### Hunk 탐색

| 키 | 설명 |
|----|------|
| `]c` | 다음 변경 블록(hunk)으로 이동 |
| `[c` | 이전 변경 블록(hunk)으로 이동 |

### Hunk 관리 (`<Space>g`)

| 키 | 설명 |
|----|------|
| `<leader>gs` | Hunk 스테이징 |
| `<leader>gr` | Hunk 되돌리기 (reset) |
| `<leader>gS` | 버퍼 전체 스테이징 |
| `<leader>gR` | 버퍼 전체 되돌리기 |
| `<leader>gu` | 스테이징 취소 (undo) |
| `<leader>gp` | Hunk 미리보기 |
| `<leader>gb` | 현재 줄 blame 보기 |
| `<leader>gD` | 마지막 커밋과 diff |

### 토글 (`<Space>t`)

| 키 | 설명 |
|----|------|
| `<leader>tb` | 줄별 blame 표시 토글 |
| `<leader>tD` | 삭제된 줄 표시 토글 |

---

## 2.2 lazygit.nvim

neovim 안에서 lazygit TUI를 실행하는 플러그인

### 키맵

| 키 | 설명 |
|----|------|
| `<leader>gg` | LazyGit 열기 |
| `<leader>gf` | 현재 파일의 LazyGit 열기 |

### 주요 LazyGit 키맵 (LazyGit 내부)

| 키 | 설명 |
|----|------|
| `space` | 파일 스테이징/언스테이징 |
| `c` | 커밋 |
| `p` | 푸시 |
| `P` | 풀 |
| `b` | 브랜치 메뉴 |
| `q` | 종료 |
| `?` | 도움말 |

**참고:** 시스템에 `lazygit`이 설치되어 있어야 합니다.

---

## 2.3 diffview.nvim

Git diff를 보기 좋게 표시하는 플러그인

### 키맵

| 키 | 설명 |
|----|------|
| `<leader>gd` | Diffview 열기 (현재 변경사항) |
| `<leader>gh` | 현재 파일 히스토리 |
| `<leader>gH` | 브랜치 전체 히스토리 |
| `<leader>gc` | Diffview 닫기 |

### Diffview 내부 키맵

| 키 | 설명 |
|----|------|
| `<Tab>` | 다음 파일 |
| `<S-Tab>` | 이전 파일 |
| `]x` | 다음 충돌 |
| `[x` | 이전 충돌 |
| `q` | 닫기 |

---

# 3. 코드 구조

## 3.1 aerial.nvim

파일 내 함수, 클래스 등의 구조를 사이드바로 보여주는 플러그인

### 키맵

| 키 | 설명 |
|----|------|
| `<leader>a` | Aerial 토글 (열기/닫기) |

### Aerial 내부 키맵

| 키 | 설명 |
|----|------|
| `<CR>` | 해당 심볼로 이동 |
| `<C-v>` | 수직 분할로 열기 |
| `<C-s>` | 수평 분할로 열기 |
| `{` / `}` | 이전/다음 심볼 |
| `[[` / `]]` | 이전/다음 상위 심볼 |
| `q` | 닫기 |

### 사용 시나리오

1. **긴 파일 탐색**
   - `<Space>a`로 우측에 Outline 열기
   - 함수/클래스 목록에서 원하는 항목 선택
   - Enter로 해당 위치로 이동

2. **코드 구조 파악**
   - 새로운 파일을 열면 `<Space>a`로 전체 구조 확인
   - 계층 구조로 클래스, 메서드, 변수 확인 가능

---

## 3.2 trouble.nvim

에러, 경고, 참조 등을 보기 좋은 목록으로 보여주는 플러그인

### 키맵 (`<Space>x`)

| 키 | 설명 |
|----|------|
| `<leader>xx` | 전체 프로젝트 진단 목록 |
| `<leader>xX` | 현재 버퍼 진단 목록 |
| `<leader>xs` | 심볼 목록 |
| `<leader>xl` | LSP 정의/참조 목록 |
| `<leader>xL` | Location List |
| `<leader>xQ` | Quickfix List |

### Trouble 내부 키맵

| 키 | 설명 |
|----|------|
| `<CR>` | 해당 위치로 이동 |
| `j` / `k` | 다음/이전 항목 |
| `q` | 닫기 |
| `r` | 새로고침 |

### 사용 시나리오

1. **에러 수정**
   - 코드 작성 후 `<Space>xx`로 모든 에러/경고 확인
   - 목록에서 선택하면 해당 위치로 이동
   - 수정 후 목록이 자동 업데이트됨

2. **참조 확인**
   - 함수 위에서 `<Space>xl`
   - 해당 함수의 정의, 참조 목록을 한눈에 확인

3. **`<Space>q` vs `<Space>xx`**
   - `<Space>q`: 기본 quickfix (간단)
   - `<Space>xx`: Trouble (더 보기 좋고 기능 많음)

---

# 4. 편의 기능

## 4.1 todo-comments.nvim

코드 내 TODO, FIXME, HACK 등을 하이라이트하고 검색하는 플러그인

### 지원 키워드

| 키워드 | 색상 | 설명 |
|--------|------|------|
| `TODO` | 파란색 | 할 일 |
| `FIXME`, `BUG` | 빨간색 | 버그, 수정 필요 |
| `HACK` | 주황색 | 임시 해결책 |
| `WARN`, `XXX` | 주황색 | 경고 |
| `PERF`, `OPTIMIZE` | 보라색 | 성능 개선 필요 |
| `NOTE`, `INFO` | 초록색 | 참고 사항 |

### 키맵

| 키 | 설명 |
|----|------|
| `]t` | 다음 TODO로 이동 |
| `[t` | 이전 TODO로 이동 |
| `<leader>st` | 프로젝트 전체 TODO 검색 |

### 사용 예시

```java
// TODO: 사용자 인증 로직 추가
// FIXME: null 체크 필요
// HACK: 임시로 하드코딩
// NOTE: API v2에서 변경됨
```

---

## 4.2 nvim-surround

텍스트를 괄호, 따옴표 등으로 감싸거나 변경하는 플러그인

### 키맵

| 키 | 설명 |
|----|------|
| `ys{motion}{char}` | 감싸기 (add) |
| `ds{char}` | 감싼 것 제거 (delete) |
| `cs{old}{new}` | 감싼 것 변경 (change) |

### 사용 예시

```
1. 단어를 따옴표로 감싸기:
   hello → ysiw" → "hello"

2. 괄호 제거:
   (hello) → ds( → hello

3. 따옴표를 괄호로 변경:
   "hello" → cs"( → (hello)

4. 전체 줄 감싸기:
   hello world → yss" → "hello world"

5. Visual 모드에서:
   텍스트 선택 후 S" → "선택된 텍스트"
```

### 자주 쓰는 문자

| 문자 | 결과 |
|------|------|
| `"` `'` `` ` `` | 따옴표 |
| `(` `)` `b` | 괄호 ( ) |
| `{` `}` `B` | 중괄호 { } |
| `[` `]` | 대괄호 [ ] |
| `<` `>` | 꺾쇠 < > |
| `t` | HTML 태그 |

---

# 5. 요약 치트시트

```
[생산성]
autopairs      : 자동 - 괄호/따옴표 입력 시 자동 닫기
nvim-ts-autotag: 자동 - HTML/Vue 태그 자동 닫기
flash.nvim     : s / S - 빠른 점프 / Treesitter 선택
harpoon        : <Space>ha  - 파일 추가
                 <Space>hm  - 메뉴 열기
                 <Space>h1~4 - 파일 전환

[Git]
gitsigns       : ]c / [c    - 다음/이전 hunk 이동
                 <Space>gs  - hunk 스테이징
                 <Space>gr  - hunk 되돌리기
                 <Space>gp  - hunk 미리보기
                 <Space>gb  - blame 보기
lazygit        : <Space>gg  - LazyGit 열기
diffview       : <Space>gd  - diff 보기
                 <Space>gh  - 파일 히스토리
                 <Space>gc  - 닫기

[코드 구조]
aerial.nvim    : <Space>a   - Aerial 토글
                 { / }      - 이전/다음 심볼
                 q          - 닫기
trouble.nvim   : <Space>xx  - 전체 진단 목록
                 <Space>xX  - 현재 버퍼 진단
                 <Space>xs  - 심볼 목록
                 <Space>xl  - LSP 정의/참조

[편의 기능]
todo-comments  : ]t / [t    - 다음/이전 TODO
                 <Space>st  - TODO 검색
nvim-surround  : ysiw"      - 단어를 "로 감싸기
                 ds(        - 괄호 제거
                 cs"'       - " → ' 변경
```
