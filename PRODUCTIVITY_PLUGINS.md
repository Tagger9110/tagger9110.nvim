# 생산성 향상 플러그인 매뉴얼

## 1. autopairs (nvim-autopairs)

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

## 2. nvim-ts-autotag

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

## 3. flash.nvim

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

## 4. harpoon

자주 사용하는 파일을 즐겨찾기에 등록하고 빠르게 전환하는 플러그인

### 키맵

| 키 | 설명 |
|----|------|
| `<leader>ha` | 현재 파일을 Harpoon 목록에 추가 |
| `<leader>hm` | Harpoon 메뉴 열기/닫기 |
| `<leader>h1` | 1번 파일로 이동 |
| `<leader>h2` | 2번 파일로 이동 |
| `<leader>h3` | 3번 파일로 이동 |
| `<leader>h4` | 4번 파일로 이동 |

### 사용 시나리오

1. **파일 등록**
   - 자주 편집하는 파일 열기
   - `<Space>ha`로 Harpoon 목록에 추가

2. **파일 전환**
   - `<Space>h1` ~ `<Space>h4`로 즉시 전환
   - 또는 `<Space>hm`으로 메뉴 열어서 선택

3. **목록 관리**
   - `<Space>hm`으로 메뉴 열기
   - 메뉴에서 파일 순서 변경 가능
   - `dd`로 목록에서 제거

### 팁
- 프로젝트당 최대 4개 핵심 파일만 등록 권장
- 예: Controller, Service, View, Test 파일

---

## 요약 치트시트

```
autopairs     : 자동 - 괄호/따옴표 입력 시 자동 닫기
nvim-ts-autotag: 자동 - HTML/Vue 태그 자동 닫기

flash.nvim    : s    - 화면 내 빠른 점프
                S    - Treesitter 블록 선택

harpoon       : <Space>ha - 파일 추가
                <Space>hm - 메뉴 열기
                <Space>h1~4 - 파일 전환
```
