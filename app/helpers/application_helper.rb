module ApplicationHelper

  def level_category(honor)
    [
      [0, "noobie"],            # 8 kyu
      [20, "rookie"],           # 7 kyu
      [76, "recruit"],          # 6 kyu
      [229, "apprentice"],      # 5 kyu
      [643, "ninja"],           # 4 kyu
      [1768, "samurai"],        # 3 kyu
      [4829, "master"],         # 2 kyu
      [13147, "grand master"],  # 2 kyu
      [35759, "angel"],         # 1 dan
      [97225, "god"]            # 2 dan
    ]
    .reverse.find { |e| e.first <= honor }.last
  end
end
